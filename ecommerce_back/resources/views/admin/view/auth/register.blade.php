<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register | Attex - Bootstrap 5 Admin & Dashboard Template</title>
    @include('admin.layouts.title-meta')
    @include('admin.layouts.head-css')
</head>
<body class="authentication-bg pb-0">
    @include('admin.layouts.loading')
    <div class="auth-fluid">
        <!--Auth fluid left content -->
        <div class="auth-fluid-form-box">
            <div class="card-body d-flex flex-column h-100 gap-3">
                <div class="auth-brand text-center text-lg-start">
                    <a href="index.php" class="logo-dark">
                        <span><img src="assets/images/logo-dark.png" alt="dark logo" height="22"></span>
                    </a>
                    <a href="index.php" class="logo-light">
                        <span><img src="assets/images/logo.png" alt="logo" height="22"></span>
                    </a>
                </div>
                <div class="my-auto">
                    <h4 class="mt-3">Free Sign Up</h4>
                    <p class="text-muted mb-4">Don't have an account? Create your account, it takes less than a minute</p>
                    <form action="{{route('server.register')}}" method="post">
                    @csrf
                        <div class="mb-3">
                            <label for="fullname" class="form-label">Full Name</label>
                            <input class="form-control" type="text" id="fullname" name="username" placeholder="Enter your name" required>
                        </div>
                        <div class="mb-3">
                            <label for="emailaddress" class="form-label">Email address</label>
                            <input class="form-control" type="email" id="emailaddress" name="email" required placeholder="Enter your email">
                        </div>
                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input class="form-control" type="password" required id="password" name="password" placeholder="Enter your password">
                        </div>
                        <div class="mb-3">
                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="checkbox-signup">
                                <label class="form-check-label" for="checkbox-signup">I accept <a href="javascript: void(0);" class="text-muted">Terms and Conditions</a></label>
                            </div>
                        </div>
                        <div class="mb-0 d-grid text-center">
                            <button class="btn btn-primary fw-semibold" type="submit">Sign Up </button>
                        </div>
                        <div class="text-center mt-4">
                            <p class="text-muted fs-16">Create account using</p>
                            <ul class="social-list list-inline mt-3">
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item border-primary text-primary"><i class="ri-facebook-circle-fill"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item border-danger text-danger"><i class="ri-google-fill"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item border-info text-info"><i class="ri-twitter-fill"></i></a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="javascript: void(0);" class="social-list-item border-secondary text-secondary"><i class="ri-github-fill"></i></a>
                                </li>
                            </ul>
                        </div>
                    </form>
                </div>
                <footer class="footer footer-alt">
                    <p class="text-muted">Already have account? <a href="{{route('page.login')}}" class="text-muted ms-1"><b>Log In</b></a></p>
                </footer>
            </div>
        </div>
        <div class="auth-fluid-right text-center">
            <div class="auth-user-testimonial">
                <div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <h2 class="mb-3">I love the color!</h2>
                            <p class="lead"><i class="ri-double-quotes-l"></i> Everything you need is in this template. Love the overall look and feel. Not too flashy, and still very professional and smart.
                            </p>
                            <p>
                                - Admin User
                            </p>
                        </div>
                        <div class="carousel-item">
                            <h2 class="mb-3">Flexibility !</h2>
                            <p class="lead"><i class="ri-double-quotes-l"></i> Pretty nice theme, hoping you guys could add more features to this. Keep up the good work.
                            </p>
                            <p>
                                - Admin User
                            </p>
                        </div>
                        <div class="carousel-item">
                            <h2 class="mb-3">Feature Availability!</h2>
                            <p class="lead"><i class="ri-double-quotes-l"></i> This is a great product, helped us a lot and very quick to work with and implement.
                            </p>
                            <p>
                                - Admin User
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @include("admin.layouts.footer-scripts")
    <script src="{{asset('assets/js/app.min.js')}}"></script>
</body>
</html>