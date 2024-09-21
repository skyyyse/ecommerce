<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item_model extends Model
{
    use HasFactory;
    protected $table = 'item';
    protected $fillable = [
        'order_id',
        'product_id',
        'qty',
        'price',
        'totalprice'
    ];
    public function order(){
        return $this->belongsTo(related: Order_model::class,);
    }
    public function product(){
        return $this->belongsTo(related: Product::class,);
    }
}
