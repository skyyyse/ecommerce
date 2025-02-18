<!DOCTYPE html>
<html lang="en">
<head>
    <title>Dashboard | Attex - Bootstrap 5 Admin & Dashboard Template</title>
    @include('admin.layouts.title-meta')
    <link rel="stylesheet" href="{{asset('assets/vendor/daterangepicker/daterangepicker.css')}}">
    <link rel="stylesheet" href="{{asset('assets/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css')}}">
    @include("admin.layouts.head-css")
</head>
<body>
<div id="preloader">
        <div id="status">
            <div class="bouncing-loader">
                <div></div>
                <div></div>
                <div></div>
            </div>
        </div>
    </div>
    <div class="wrapper">
        @include("admin.layouts.menu")
        <div class="content-page">
            <div class="content">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-12">
                            <div class="page-title-box">
                                <div class="page-title-right">
                                    <form class="d-flex">
                                        <!-- <div class="input-group">
                                            <input type="text" class="form-control shadow border-0" id="dash-daterange">
                                            <span class="input-group-text bg-primary border-primary text-white">
                                                <i class="ri-calendar-todo-fill fs-13"></i>
                                            </span>
                                        </div>
                                        <a href="javascript: void(0);" class="btn btn-primary ms-2">
                                            <i class="ri-refresh-line"></i>
                                        </a> -->
                                    </form>
                                </div>
                                <!-- <h4 class="page-title">Dashboard</h4> -->
                            </div>
                        </div>
                    </div>

                    <div class="row row-cols-1 row-cols-xxl-5 row-cols-lg-3 row-cols-md-2">
                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-muted fw-normal mt-0" title="Number of Customers">Customers</h5>
                                            <h3 class="my-3">{{$customer}}</h3>
                                            <p class="mb-0 text-muted text-truncate">
                                                <span class="badge bg-success me-1"><i class="ri-arrow-up-line"></i> 2,541</span>
                                                <span>Since last month</span>
                                            </p>
                                        </div>
                                        <div class="flex-shrink-0">
                                            <div id="widget-customers" class="apex-charts" data-colors="#47ad77,#e3e9ee"></div>
                                        </div>
                                    </div>
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-muted fw-normal mt-0" title="Number of Orders">Orders</h5>
                                            <h3 class="my-3">{{$order}}</h3>
                                            <p class="mb-0 text-muted text-truncate">
                                                <span class="badge bg-danger me-1"><i class="ri-arrow-down-line"></i> 1.08%</span>
                                                <span>Since last month</span>
                                            </p>
                                        </div>
                                        <div id="widget-orders" class="apex-charts" data-colors="#3e60d5,#e3e9ee"></div>
                                    </div>
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                        <div class="col">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-muted fw-normal mt-0" title="Average Revenue">Revenue</h5>
                                            <h3 class="my-3">$9,254</h3>
                                            <p class="mb-0 text-muted text-truncate">
                                                <span class="badge bg-danger me-1"><i class="ri-arrow-down-line"></i> 7.00%</span>
                                                <span>Since last month</span>
                                            </p>
                                        </div>
                                        <div id="widget-revenue" class="apex-charts" data-colors="#16a7e9,#e3e9ee"></div>
                                    </div>

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                        <div class="col col-lg-6">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-muted fw-normal mt-0" title="Growth">Growth</h5>
                                            <h3 class="my-3">+ 20.6%</h3>
                                            <p class="mb-0 text-muted text-truncate">
                                                <span class="badge bg-success me-1"><i class="ri-arrow-up-line"></i> 4.87%</span>
                                                <span>Since last month</span>
                                            </p>
                                        </div>
                                        <div id="widget-growth" class="apex-charts" data-colors="#ffc35a,#e3e9ee"></div>
                                    </div>

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                        <div class="col col-lg-6 col-md-12">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between">
                                        <div class="flex-grow-1 overflow-hidden">
                                            <h5 class="text-muted fw-normal mt-0" title="Conversation Ration">Conversation</h5>
                                            <h3 class="my-3">9.62%</h3>
                                            <p class="mb-0 text-muted text-truncate">
                                                <span class="badge bg-success me-1"><i class="ri-arrow-up-line"></i> 3.07%</span>
                                                <span>Since last month</span>
                                            </p>
                                        </div>
                                        <div id="widget-conversation" class="apex-charts" data-colors="#f15776,#e3e9ee"></div>
                                    </div>

                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                    </div> <!-- end row -->

                    <div class="row">
                        <div class="col-lg-8">
                            <div class="card">
                                <div class="d-flex card-header justify-content-between align-items-center">
                                    <h4 class="header-title">Revenue</h4>
                                    <div class="dropdown">
                                        <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Export Report</a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Profit</a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Action</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div class="bg-light-subtle border-top border-bottom border-light">
                                        <div class="row text-center">
                                            <div class="col">
                                                <p class="text-muted mt-3"><i class="ri-donut-chart-fill"></i> Current Week</p>
                                                <h3 class="fw-normal mb-3">
                                                    <span>$1705.54</span>
                                                </h3>
                                            </div>
                                            <div class="col">
                                                <p class="text-muted mt-3"><i class="ri-donut-chart-fill"></i> Previous Week</p>
                                                <h3 class="fw-normal mb-3">
                                                    <span>$6,523.25 <i class="ri-corner-right-up-fill text-success"></i></span>
                                                </h3>
                                            </div>
                                            <div class="col">
                                                <p class="text-muted mt-3"><i class="ri-donut-chart-fill"></i> Conversation</p>
                                                <h3 class="fw-normal mb-3">
                                                    <span>8.27%</span>
                                                </h3>
                                            </div>
                                            <div class="col">
                                                <p class="text-muted mt-3"><i class="ri-donut-chart-fill"></i> Customers</p>
                                                <h3 class="fw-normal mb-3">
                                                    <span>69k <i class="ri-corner-right-down-line text-danger"></i></span>
                                                </h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body pt-0">
                                    <div dir="ltr">
                                        <div id="revenue-chart" class="apex-charts mt-3" data-colors="#3e60d5,#47ad77"></div>
                                    </div>
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="d-flex card-header justify-content-between align-items-center">
                                    <h4 class="header-title">Total Sales</h4>
                                    <div class="dropdown">
                                        <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="ri-more-2-fill"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Export Report</a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Profit</a>
                                            <!-- item-->
                                            <a href="javascript:void(0);" class="dropdown-item">Action</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body p-0">
                                    <div class="alert alert-warning rounded-0 mb-0 border-end-0 border-start-0" role="alert">
                                        Something went wrong. Please <strong><a href="#!" class="alert-link text-decoration-underline">refresh</a></strong> to get new data!
                                    </div>
                                </div>

                                <div class="card-body pt-0">
                                    <div id="average-sales" class="apex-charts mb-3" data-colors="#3e60d5,#47ad77,#fa5c7c,#16a7e9"></div>

                                    <h5 class="mb-1 mt-0 fw-normal">Brooklyn, New York</h5>
                                    <div class="progress-w-percent">
                                        <span class="progress-value fw-bold">72k </span>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar" role="progressbar" style="width: 72%;" aria-valuenow="72" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>

                                    <h5 class="mb-1 mt-0 fw-normal">The Castro, San Francisco</h5>
                                    <div class="progress-w-percent">
                                        <span class="progress-value fw-bold">39k </span>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar" role="progressbar" style="width: 39%;" aria-valuenow="39" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>

                                    <h5 class="mb-1 mt-0 fw-normal">Kovan, Singapore</h5>
                                    <div class="progress-w-percent mb-0">
                                        <span class="progress-value fw-bold">61k </span>
                                        <div class="progress progress-sm">
                                            <div class="progress-bar" role="progressbar" style="width: 61%;" aria-valuenow="61" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div> <!-- end card-body-->
                            </div> <!-- end card-->
                        </div> <!-- end col-->

                    </div>
                </div>
                <!-- container -->

            </div>
            <!-- content -->
            @include("admin.layouts.footer")

        </div>
    </div>
    @include("admin.layouts.right-sidebar")
    @include("admin.layouts.footer-scripts")
    <script src="{{asset('assets/vendor/daterangepicker/moment.min.js')}}"></script>
    <script src="{{asset('assets/vendor/daterangepicker/daterangepicker.js')}}"></script>
    <script src="{{asset('assets/vendor/apexcharts/apexcharts.min.js')}}"></script>
    <script src="{{asset('assets/vendor/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js')}}"></script>
    <script src="{{asset('assets/vendor/admin-resources/jquery.vectormap/maps/jquery-jvectormap-world-mill-en.js')}}"></script>
    <script src="{{asset('assets/js/pages/demo.dashboard.js')}}"></script>
    <script src="{{asset('assets/js/app.min.js')}}"></script>

</body>

</html>