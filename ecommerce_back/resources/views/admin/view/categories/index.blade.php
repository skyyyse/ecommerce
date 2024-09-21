<!DOCTYPE html>
<html lang="en">
<head>
    <title>Datatables | Attex - Bootstrap 5 Admin & Dashboard Template</title>
    @include('admin.layouts.title-meta')
    <link href="{{asset('assets/vendor/datatables.net-bs5/css/dataTables.bootstrap5.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/vendor/datatables.net-responsive-bs5/css/responsive.bootstrap5.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/vendor/datatables.net-fixedcolumns-bs5/css/fixedColumns.bootstrap5.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/vendor/datatables.net-fixedheader-bs5/css/fixedHeader.bootstrap5.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/vendor/datatables.net-buttons-bs5/css/buttons.bootstrap5.min.css')}}" rel="stylesheet" type="text/css" />
    <link href="{{asset('assets/vendor/datatables.net-select-bs5/css/select.bootstrap5.min.css')}}" rel="stylesheet" type="text/css" />
    @include("admin.layouts.head-css")
</head>
<body>
    @include('admin.layouts.loading')
    <div class="wrapper">
        @include("admin.layouts.menu")
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <a class="btn btn-success" href="{{route('categories.page.store')}}">Create Categories</a>
                                </div>
                                <h4 class="page-title">Datatables</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-body">
                                    <table id="scroll-horizontal-datatable" class="table table-striped w-100 nowrap">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Status</th>
                                                <th>Create date</th>
                                                <th>Updated date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($Categories as $key=>$Categories_data )
                                            <tr>
                                                <td>{{$key+1}}</td>
                                                <td>{{$Categories_data->title}}</td>
                                                <!-- <td>System Architect</td> -->
                                                <td style="color:<?php echo $Categories_data->status == 1 ? 'blue' : 'red' ?> ;">{{$Categories_data->status==1?"Enable":"Disable"}}</td>
                                                <td>{{$Categories_data->created_at}}</td>
                                                <td>{{$Categories_data->updated_at}}</td>
                                                <td>
                                                    <div class="d-flex flex-wrap gap-2">
                                                        <button value="{{$Categories_data->id}}" onclick="categories_update(this)" data-bs-toggle="modal" data-bs-target="#update" style="height: 25px;font-size: 8px;" type="button" class="btn btn-soft-success">Update</button>
                                                        <button value="{{$Categories_data->id}}" onclick="delete_data(this)" data-bs-toggle="modal" data-bs-target="#delete" style="height: 25px;font-size: 8px;" type="button" class="btn btn-soft-danger">Delete</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include("admin.layouts.footer")
        </div>
    </div>
    </div>
    @include('admin.include.script')
    @include('admin.view.categories.update')
    @include('admin.view.categories.delete')
    @include("admin.layouts.right-sidebar")
    @include("admin.layouts.footer-scripts")
    <script src="{{asset('assets/vendor/datatables.net/js/jquery.dataTables.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-bs5/js/dataTables.bootstrap5.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-responsive-bs5/js/responsive.bootstrap5.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-fixedcolumns-bs5/js/fixedColumns.bootstrap5.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-buttons-bs5/js/buttons.bootstrap5.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-buttons/js/buttons.flash.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-keytable/js/dataTables.keyTable.min.js')}}"></script>
    <script src="{{asset('assets/vendor/datatables.net-select/js/dataTables.select.min.js')}}"></script>
    <script src="{{asset('assets/js/pages/demo.datatable-init.js')}}"></script>
    <script src="{{asset('assets/js/app.min.js')}}"></script>

</body>

</html>