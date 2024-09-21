<!DOCTYPE html>
<html lang="en">

<head>
    <title>Form Validation | Attex - Bootstrap 5 Admin & Dashboard Template</title>
    @include('admin.layouts.title-meta')
    @include('admin.layouts.head-css')
</head>

<body>
    @include("admin.layouts.loading")
    <div class="wrapper">
        @include('admin.layouts.menu')
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <form action="{{route('user.store')}}" class="needs-validation" novalidate method="post" enctype="multipart/form-data">
                                        @csrf
                                        <div class="mb-3">
                                            <label class="form-label" for="validationCustom01">Username</label>
                                            <input type="text" name="username" class="form-control" id="validationCustom01" placeholder="Username">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="validationCustom01">Email</label>
                                            <input type="text" name="email" class="form-control" id="validationCustom01" placeholder="Email">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="validationCustom01">Phone</label>
                                            <input type="text" name="phone" class="form-control" id="validationCustom01" placeholder="Phone">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="validationCustom02">Status</label>
                                            <select id="active" name="status" class="form-select @error('active')border-danger  @enderror">
                                                <option value="">Select Status</option>
                                                <option value="1">Enable</option>
                                                <option value="0">Disable</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="validationCustom01">Password</label>
                                            <input type="text" name="password" class="form-control" id="validationCustom01" placeholder="Password">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="validationCustom01">Confirm Password</label>
                                            <input type="text" name="confirm_password" class="form-control" id="validationCustom01" placeholder="Confirm Password">
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label" for="validationCustom02">File Image</label>
                                            <input type="file" class="form-control" id="validationCustom02" name="image">
                                            <div class="valid-feedback">
                                                Looks good!
                                            </div>
                                        </div>
                                        <button class="btn btn-primary" type="submit">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            @include('admin.layouts.footer')
        </div>
    </div>
    </div>
    @include("admin.layouts.right-sidebar")
    @include("admin.layouts.footer-scripts")
    <script src="{{asset('assets/js/app.min.js')}}"></script>
</body>

</html>