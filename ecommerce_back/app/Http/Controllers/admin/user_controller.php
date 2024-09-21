<?php

namespace App\Http\Controllers\admin;

use Illuminate\Support\Str;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class user_controller extends Controller
{
    public function index()
    {
        $user = Auth::user();
        $userall = User::all();
        return view("admin.view.user.index", compact("user", 'userall'));
    }
    public function store_page()
    {
        $user = Auth::user();
        return view('admin.view.user.create', compact('user'));
    }
    public function store(Request $request)
    {
        $request->validate([
            "username" => "required",
            "email" => "required",
            "phone" => "required",
            "status" => "required",
            "password" => "required",
            "confirm_password" => "required",
            "image" => "required",
        ]);
        if ($request->password != $request->confirm_password) {
            return redirect()->route(route: "user.page.create")->with("success","You wrong the Password....?");
        } else {
            $imageName = Str::random(40) . '.' . $request->image->getClientOriginalExtension();
            $request->image->move(public_path('Image/User/Image'), $imageName);
            $user = User::create(
                attributes: [
                    "username" => $request->username,
                    "email" => $request->email,
                    "phone" => $request->phone,
                    "status" => $request->status,
                    "password" => Hash::make($request->password),
                    "image" => $imageName
                ],
            );
            if($user){
                return redirect()->route("user.index")->with("success","");
            }
        }
    }
    public function delete(Request $request){
        $user = User::find($request->id);
        $imagePath = public_path('Image/User/Image') . '/' . $user->image;
        if (file_exists($imagePath)) {
            unlink($imagePath);
            if ($user->delete()) {
                return redirect()->route('user.index');
            }
        }
    }
    public function update(Request $request){
        $user = User::find($request->id);
        if ($request->hasFile('image')) {
            $imageName = Str::random(40) . '.' . $request->image->getClientOriginalExtension();
            $imagePath = public_path('Image/User/Image') . '/' . $user->image;
            if ($request->image->isValid()) {
                if (file_exists($imagePath)) {
                    $request->image->move(public_path('Image/User/Image'), $imageName);
                    User::where('id', $request->id)->update([
                        'username'=> $request->username,
                        'email'=> $request->email,
                        'phone'=> $request->phone,
                        'role'=> $request->role,
                        'address'=> $request->textarea,
                        'image'=>$imageName,
                    ]);
                    return redirect()->route(route: 'user.index');
                }else{
                    if(unlink($imagePath)){
                        $request->image->move(public_path('Image/User/Image'), $imageName);
                        User::where('id', $request->id)->update([
                            'username'=> $request->username,
                            'email'=> $request->email,
                            'phone'=> $request->phone,
                            'role'=> $request->role,
                            'address'=> $request->textarea,
                            'image'=>$imageName,
                        ]);
                        return redirect()->route(route: 'user.index');
                    }
                }
            }
        } else {
            User::where('id', $request->id)->update([
                'username'=> $request->username,
                'email'=> $request->email,
                'phone'=> $request->phone,
                'role'=> $request->role,
                'address'=> $request->textarea,
            ]);
            if ($user->save()) {
                return redirect()->route('user.index');
            }
        }
    }
}
