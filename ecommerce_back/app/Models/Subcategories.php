<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Subcategories extends Model
{
    use HasFactory;
    protected $primaryKey='id';
    protected $table='subcategories';
    protected $fillable=['title','image','status','categories_id'];

    public function categories(){
        return $this->belongsTo(Categories::class,'categories_id');
    }
    public function product(){
        return $this->hasMany(Product::class,'subcategories_id');
    }
}
