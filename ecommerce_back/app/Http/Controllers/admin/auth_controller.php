<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class auth_controller extends Controller
{
    public function login()
    {
        return view('admin.view.auth.login');
    }
    public function register()
    {
        return view('admin.view.auth.register');
    }
    public function login_server(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);
        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            if (Auth::user()->role == 1) {
                return redirect()->route('index');
            } else {
                return redirect()->route('page.login');
            }
        } else {
            return redirect()->route('page.login');
        }
    }
    public function register_server(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            "email" => "required|email|unique:users",
            'password' => 'required',
        ]);
        $user = User::create([
            'role'=>1,
            'username' => $request->username,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
        if ($user) {
            return redirect()->route('page.login');
        }
    }
    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('page.login');
    }
}
