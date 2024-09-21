<?php

namespace App\Http\Controllers\admin;
use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class slider_controller extends Controller
{
    public function index(){
        $user=Auth::user();
        $Slider=Slider::all();
        return view("admin.view.slider.index",compact("Slider","user"));
    }
    public function create(){
        $user=Auth::user();
        return view("admin.view.slider.create",compact("user"));
    }
    public function update(){
        return view('admin.view.slider.update');
    }
    public function store(Request $request){
        // dd($request->all());
        $request->validate([
            "title" => "required",
            "status" => "required",
            "file_image" => "required",
        ]);
        $imageName = Str::random(40) . '.' . $request->file_image->getClientOriginalExtension();
        $request->file_image->move(public_path('Image/Slider/Image'), $imageName);
        $Slider = Slider::create([
            'title' => $request->title,
            'status' => $request->status,
            'image' => $imageName
        ]);
        if ($Slider->save()) {
            return redirect()->route('slider.index')->with('sucess', 'Create slider sucessfully');
        }
    }
    public function delete(Request $request)
    {
        $Slider = Slider::find($request->slider_id);
        $imagePath = public_path('Image/Slider/Image') . '/' . $Slider->image;
        if (file_exists($imagePath)) {
            unlink($imagePath);
            if ($Slider->delete()) {
                return redirect()->route('slider.index');
            }
        }
    }
    
    public function edit(Request $request)
    {
        // dd($request->all());
        $Slider = Slider::find($request->slider_id);
        if ($request->hasFile('fileInput')) {
            $imagePath = public_path('Image/Slider/Image') . '/' . $Slider->image;
            if ($request->fileInput->isValid()) {
                if (file_exists($imagePath)) {
                    unlink($imagePath);
                    $imageName = Str::random(40) . '.' . $request->fileInput->getClientOriginalExtension();
                    $request->fileInput->move(public_path('Image/Slider/Image'), $imageName);
                    Slider::where('id', $request->slider_id)->update([
                        'title' => $request->title,
                        'status' => $request->status,
                        'image' => $imageName
                    ]);
                    return redirect()->route('slider.index');
                }
            }
        } else {
            Slider::where('id', $request->slider_id)->update([
                'title'=> $request->title,
                'status'=> $request->status
            ]);
            if ($Slider->save()) {
                return redirect()->route('slider.index')->with('sucess', 'Create slider sucessfully');
            }
        }
    }
}
