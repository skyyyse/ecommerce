<div class="modal fade" id="update" tabindex="-1" aria-labelledby="update" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{route('user.update')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="fullscreeexampleModalLabel">
                        Full Screen Modal
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="card border border-end-1" style="margin-top: 8px;">
                        <div class="card-body">
                            @if (session('success'))
                            <div class="alert alert-success" role="alert">
                                <i class="ri-check-line me-1 align-middle fs-16"></i>
                                <strong>{{ session('success') }}</strong>
                            </div>
                            @endif
                            <div class="row g-2">
                                <div class="mb-3 col-md-6">
                                    <label for="exampleInputEmail1" class="form-label">Username</label>
                                    <input type="hidden" name="id" id="user_id">
                                    <input type="text" class="form-control form-control-sm @error('title')border-danger  @enderror" id="username" name="username" aria-describedby="emailHelp" placeholder="Username">
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="exampleInputEmail1" class="form-label">Email</label>
                                    <input type="text" class="form-control form-control-sm @error('title')border-danger  @enderror" id="email" name="email" aria-describedby="emailHelp" placeholder="Email">
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="mb-3 col-md-6">
                                    <label for="exampleInputEmail1" class="form-label">Phone</label>
                                    <input type="text" class="form-control form-control-sm @error('title')border-danger  @enderror" id="phone" name="phone" aria-describedby="emailHelp" placeholder="Phone">
                                </div>
                                <div class="mb-3 col-md-6">
                                    <label for="exampleInputPassword1" class="form-label">Select Role</label>
                                    <select id="role" name="role" class="form-control form-control-sm @error('active')border-danger  @enderror">
                                        <option value="">Select Status</option>
                                        <option value="1">Admin</option>
                                        <option value="0">User</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="mb-3 col-md-12">
                                    <label for="exampleInputEmail1" class="form-label">Description</label>
                                    <textarea class="form-control" placeholder="Description here" id="textarea" name="textarea" rows="6" cols="40"></textarea>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="mb-3 col-md-12">
                                    <label for="exampleInputEmail1" class="form-label">Image</label>
                                    <input type="file" name="image"  onchange="showImagePreview(this)" class="form-control form-control-sm @error('fileInput')border-danger  @enderror" id="fileInput" name="fileInput" aria-describedby="emailHelp">
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="mb-12 col-md-12" id="imagePreview" style="display: none;">
                                    <div class="card-body card mb-0 shadow-none border mb-3 col-12">
                                        <div class="d-flex align-items-center">
                                            <img src="#" alt="image" id="uploadedImage" class="me-3" style="width: 150px;border-radius: 10px;">
                                            <div class="row">
                                                <h5 class="mb-1 mt-1" id="imageName">James M. Short</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row g-2">
                                <div class="mb-12 col-md-12" id="data_image" style="display: none;">
                                    <div class="card-body card mb-0 shadow-none border mb-3 col-12">
                                        <div class="d-flex align-items-center">
                                            <img src="" alt="image" id="image" class="me-3" style="width: 150px;border-radius: 10px;">
                                            <div class="row">
                                                <h5 class="mb-1 mt-1" id="title_image" name="old_image">James M. Short</h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="javascript:void(0);" class="btn btn-light" data-bs-dismiss="modal">Close</a>
                    <button type="submit" class="btn btn-primary upload">
                        Save Changes
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>