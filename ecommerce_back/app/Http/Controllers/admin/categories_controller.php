<?php

namespace App\Http\Controllers\admin;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Categories;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class categories_controller extends Controller
{
    public function index(){
        $Categories = Categories::all();
        $user=Auth::user();
        return view("admin.view.categories.index",compact('Categories','user'));
    }
    public function page_store(){
        $user=Auth::user();
        return view('admin.view.categories.create',compact('user'));
    }
    public function store(Request $request){
        $request->validate([
            "title" => "required",
            "status" => "required",
            "file_image" => "required",
        ]);
        $imageName = Str::random(40) . '.' . $request->file_image->getClientOriginalExtension();
        $request->file_image->move(public_path('Image/Categories/Image'), $imageName);
        $Slider = Categories::create([
            'title' => $request->title,
            'status' => $request->status,
            'image' => $imageName
        ]);
        if ($Slider->save()) {
            return redirect()->route('categories.index')->with('sucess', 'Create slider sucessfully');
        }
    }
    public function destroy(Request $request){
        $Slider = Categories::find($request->categories_id);
        $imagePath = public_path('Image/Categories/Image') . '/' . $Slider->image;
        if (file_exists($imagePath)) {
            unlink($imagePath);
            if ($Slider->delete()) {
                return redirect()->route('categories.index');
            }
        }
    }
    public function update(Request $request){
        $Slider = Categories::find($request->id);
        $imagePath = public_path('Image/Categories/Image') . '/' . $Slider->image;
        if ($request->hasFile('fileInput')) {
            $file = $request->file('fileInput');
            if ($file->isValid()) {
                if (file_exists($imagePath)) {
                    unlink($imagePath);
                    $imageName = Str::random(40) . '.' . $request->fileInput->getClientOriginalExtension();
                    $request->fileInput->move(public_path('Image/Categories/Image'), $imageName);
                    Categories::where('id', $request->id)->update([
                        'title' => $request->title,
                        'status' => $request->status,
                        'image' => $imageName
                    ]);
                    return redirect()->route('categories.index');
                }
            }
        } else {
            Categories::where('id', $request->id)->update([
                'title'=> $request->title,
                'status'=> $request->status
            ]);
            if ($Slider->save()) {
                return redirect()->route('categories.index');
            }
        }
    }
}
