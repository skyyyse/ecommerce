<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order_model extends Model
{
    use HasFactory;
    protected $table = 'order';
    protected $fillable = [
        'user_id',
        'qty',
        'totalprice',
        'status',
        'orderid'
    ];
    public function item(){
        return $this->hasMany(Item_model::class,'order_id');
    }
    public function user(){
        return $this->belongsTo(User::class,);
    }
}
