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
                                    <a class="btn btn-success" href="{{route('user.page.create')}}">Create User</a>
                                    <!-- <button type="button" value="" class="btn btn-outline-secondary slider_update" data-bs-toggle="modal" data-bs-target="#slider_update">
                                        Create
                                    </button> -->
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
                                                <th>Username</th>
                                                <th>Email</th>
                                                <th>Phone</th>
                                                <th>Role</th>
                                                <th>Create date</th>
                                                <th>Updated date</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($userall as $key=> $userall_data )
                                            <tr>
                                                <td>{{$key+1}}</td>
                                                <td>{{$userall_data->username}}</td>
                                                <td>{{$userall_data->email}}</td>
                                                <td>{{$userall_data->phone}}</td>
                                                <td style="color:<?php echo $userall_data->role == 1 ? 'blue' : 'red' ?> ;">{{$userall_data->role==1?"Admin":"User"}}</td>
                                                <td>{{$userall_data->created_at}}</td>
                                                <td>{{$userall_data->created_at}}</td>
                                                <td>
                                                    <div class="d-flex flex-wrap gap-2">
                                                        <button value="{{$userall_data->id}}" onclick="user_update(this)" data-bs-toggle="modal" data-bs-target="#update" style="height: 25px;font-size: 8px;" type="button" class="btn btn-soft-success">Update</button>
                                                        <button value="{{$userall_data->id}}" onclick="Delete(this)" data-bs-toggle="modal" data-bs-target="#delete" style="height: 25px;font-size: 8px;" type="button" class="btn btn-soft-danger">Delete</button>
                                                    </div>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div> <!-- end card body-->
                            </div> <!-- end card -->
                        </div><!-- end col-->
                    </div> <!-- end row-->
                </div> <!-- container -->
            </div> <!-- content -->
            @include("admin.layouts.footer")
        </div>
    </div>
    @include('admin.include.script')
    @include('admin.view.user.delete')
    @include('admin.view.user.update')
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