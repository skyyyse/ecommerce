<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $primaryKey = 'id';
    protected $table = 'product';
    protected $fillable = [
        'id',
        'title',
        'description',
        'price',
        'qty',
        'subcategories_id',
        'status'
    ];
    public function image(){
        return $this->hasMany(Image::class,'product_id');
    }
    public function favorite(){
        return $this->hasMany(Favorite::class,'product_id');
    }
    public function cart(){
        return $this->hasMany(Cart::class,'product_id');
    }
    public function order(){
        return $this->hasMany(Order_model::class,'product_id');
    }
    public function subcategories(){
        return $this->belongsTo(Subcategories::class,'subcategories_id');
    }
    public function item(){
        return $this->hasMany(Item_model::class,'product_id');
    }
}
