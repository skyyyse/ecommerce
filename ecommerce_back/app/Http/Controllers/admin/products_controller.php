<?php

namespace App\Http\Controllers\admin;

use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Image;
use App\Models\Product;
use App\Models\Subcategories;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class products_controller extends Controller
{
    public function index(Request $request)
    {
        $user=Auth::user();
        $products = Product::with('subcategories')->with('image')->get();
        $subcategorise = Subcategories::all();
        return view("admin.view.products.index", compact("products", "subcategorise",'user'));
    }
    public function store_page()
    {
        $user=Auth::user();
        $subcategorise = Subcategories::all();
        return view("admin.view.products.create", compact("subcategorise","user"));
    }
    public function store(Request $request)
    {
        $request->validate([
            "title" => "required",
            "description" => "required",
            "price" => "required",
            "quality" => "required",
            "categories" => "required",
            "status" => "required",
            "file_image*" => 'required',
        ]);
        $Product = Product::create(attributes: [
            'title' => $request->title,
            'description' => $request->description,
            'price' => $request->price,
            'qty' => $request->quality,
            'subcategories_id' => $request->categories,
            'status' => $request->status,
        ]);
        if ($Product) {
            foreach ($request->file_image as $value) {
                $imageName = Str::random(40) . '.' . $value->getClientOriginalExtension();
                $value->move(public_path('Image/Product/Image'), $imageName);
                echo $imageName;
                $image = Image::create([
                    'product_id' => $Product->id,
                    'image' => $imageName,
                ]);
            }
            if ($image) {
                return redirect()->route('product.index')->with('sucess', 'Create slider sucessfully');
            }
        }
    }
    public function destroy(Request $request)
    {
        $product = Product::with(relations: 'image')->findOrFail($request->product_id);
        foreach ($product->image as $images) {
            $imagePath = public_path('Image/Product/Image/' . $images->image);
            if (file_exists($imagePath)) {
                unlink($imagePath);
            }
        }
        $product->image()->delete();
        $product->delete();
        return redirect()->route('product.index');
    }
    public function image_destroy(Request $request)
    {
        $imgae = Image::find($request->id);
        $imagePath = public_path('Image/Product/Image') . '/' . $imgae->image;
        if (file_exists($imagePath)) {
            unlink($imagePath);
            if ($imgae->delete()) {
                return redirect()->route('product.index');
            }
        }
    }
    public function update(Request $request)
    {
        //         echo dd($request->all());
        //         array:6 [▼ // app\Http\Controllers\admin\products_controller.php:82
        //   "_token" => "HQZTUlQ8dlhU5FzmcsxRc12OL6PtazNFry0KqXQj"
        //   "id" => "5"
        //   "title" => "ggggggg"
        //   "categories" => "1"
        //   "status" => "0"
        //   "file_image" => array:7 [▶]
        // ]
        $Product = Product::find($request->id);
        if ($request->hasFile('file_image')) {
            foreach ($request->file_image as $value) {
                $imageName = Str::random(40) . '.' . $value->getClientOriginalExtension();
                $value->move(public_path('Image/Product/Image'), $imageName);
                $image = Image::create([
                    'product_id' => $Product->id,
                    'image' => $imageName,
                ]);
            }
            return redirect()->route('product.index');
        } else {
            Product::where('id', $request->id)->update([
                'title' => $request->title,
                'status' => $request->status,
                'subcategories_id' => $request->categories,
            ]);
            return redirect()->route('product.index');
        }
    }


    public function test(Request $request)
    {
        dd($request->all());
        if ($request->hasfile('images')) {
            foreach ($request->file('images') as $image) {
                echo $image;
                // $path = $image->store('images', 'public');

                // // Optionally, you can manipulate the image using Intervention
                // // $img = ImageFacade::make($image);
                // // $img->resize(300, 300);
                // // $img->save(public_path('storage/images/' . $image->hashName()));

                // Image::create(['path' => $path]);
            }
        }
    }
}
