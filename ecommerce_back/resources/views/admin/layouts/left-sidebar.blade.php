<div class="leftside-menu">
  <a href="index.php" class="logo logo-light">
    <span class="logo-lg">
      <img src="{{asset('assets/images/logo.png')}}" alt="logo" />
    </span>
    <span class="logo-sm">
      <img src="{{asset('assets/images/logo-sm.png')}}" alt="small logo" />
    </span>
  </a>
  <a href="index.php" class="logo logo-dark">
    <span class="logo-lg">
      <img src="{{asset('assets/images/logo-dark.png')}}" alt="dark logo" />
    </span>
    <span class="logo-sm">
      <img src="{{asset('assets/images/logo-sm.png')}}" alt="small logo" />
    </span>
  </a>
  <div
    class="button-sm-hover"
    data-bs-toggle="tooltip"
    data-bs-placement="right"
    title="Show Full Sidebar">
    <i class="ri-checkbox-blank-circle-line align-middle"></i>
  </div>
  <div class="button-close-fullsidebar">
    <i class="ri-close-fill align-middle"></i>
  </div>
  <div class="h-100" id="leftside-menu-container" data-simplebar>
    <div class="leftbar-user">
      <a href="pages-profile.php">
        <img
          src="{{asset('assets/images/users/avatar-1.jpg')}}"
          alt="user-image"
          height="42"
          class="rounded-circle shadow-sm" />
        <span class="leftbar-user-name mt-2">Tosha Minner</span>
      </a>
    </div>
    <ul class="side-nav">
      <li class="side-nav-title">Navigation</li>

      <li class="side-nav-item">
        <a href="{{route('index')}}" class="side-nav-link">
          <i class="ri-calendar-event-line"></i>
          <span> Dashboard </span>
        </a>
      </li>

      <li class="side-nav-title">Apps</li>
      <li class="side-nav-item">
        <a href="{{route('user.index')}}" class="side-nav-link">
          <i class="ri-calendar-event-line"></i>
          <span> User </span>
        </a>
      </li>

      <li class="side-nav-item">
        <a href="{{route('slider.index')}}" class="side-nav-link">
          <i class="ri-calendar-event-line"></i>
          <span> Slider </span>
        </a>
      </li>

      <li class="side-nav-item">
        <a href="{{route('categories.index')}}" class="side-nav-link">
          <i class="ri-message-3-line"></i>
          <span> Categories </span>
        </a>
      </li>

      <li class="side-nav-item">
        <a href="{{route('subcategories.index')}}" class="side-nav-link">
          <i class="ri-message-3-line"></i>
          <span> Subcategories </span>
        </a>
      </li>

      <li class="side-nav-item">
        <a href="{{route('product.index')}}" class="side-nav-link">
          <i class="ri-message-3-line"></i>
          <span> Products </span>
        </a>
      </li>
      <li class="side-nav-item">
        <a href="{{route('order.index')}}" class="side-nav-link">
          <i class="ri-message-3-line"></i>
          <span> Order </span>
        </a>
      </li>
    </ul>
    <div class="clearfix"></div>
  </div>
</div>