<div class="modal fade" id="update" tabindex="-1" aria-labelledby="update" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{route('slider.edit')}}" method="post" enctype="multipart/form-data">
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
                                <div class="mb-3 col-md-4">
                                    <label for="exampleInputEmail1" class="form-label">Title</label>
                                    <input type="hidden" name="slider_id" id="id">
                                    <input type="text" class="form-control form-control-sm @error('title')border-danger  @enderror" id="title" name="title" aria-describedby="emailHelp" placeholder="title">
                                </div>
                                <div class="mb-3 col-md-4">
                                    <label for="exampleInputPassword1" class="form-label">Active</label>
                                    <select id="active" name="status" class="form-control form-control-sm @error('active')border-danger  @enderror">
                                        <option value="">Select Status</option>
                                        <option value="1">Enable</option>
                                        <option value="0">Disable</option>
                                    </select>
                                </div>
                                <div class="mb-3 col-md-4">
                                    <label for="exampleInputEmail1" class="form-label">Image</label>    
                                    <input type="file" name="fileInput" id="fileInput" onchange="showImagePreview(this)" class="form-control form-control-sm @error('fileInput')border-danger  @enderror" id="fileInput" name="fileInput" aria-describedby="emailHelp">
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