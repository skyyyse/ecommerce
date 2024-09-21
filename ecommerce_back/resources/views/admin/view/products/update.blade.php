<div class="modal fade" id="update" tabindex="-1" aria-labelledby="update" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <form action="{{route('product.update')}}" method="post" enctype="multipart/form-data">
                @csrf
                <div class="modal-header">
                    <h5 class="modal-title" id="fullscreeexampleModalLabel">
                        Full Screen Modal
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="card border border-end-1" style="margin-top: 8px;">
                            <div class="card-body">
                                <div class="row">
                                    <div class="mb-3 col-md-3">
                                        <label for="exampleInputEmail1" class="form-label">Title</label>
                                        <input type="hidden" name="id" id="slider_id">
                                        <input type="text" class="form-control form-control-sm @error('title')border-danger  @enderror" id="title" name="title" aria-describedby="emailHelp" placeholder="title">
                                    </div>
                                    <div class="mb-3 col-md-3">
                                        <label for="exampleInputPassword1" class="form-label">Categories</label>
                                        <select id="categories" name="categories" class="form-control form-control-sm @error('active')border-danger  @enderror">
                                            <option value="">Select Status</option>
                                            @foreach ($subcategorise as $subcategorise_data)
                                            <option value="{{$subcategorise_data->id}}">{{$subcategorise_data->title}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-3">
                                        <label for="exampleInputPassword1" class="form-label">Active</label>
                                        <select id="active" name="status" class="form-control form-control-sm @error('active')border-danger  @enderror">
                                            <option value="">Select Status</option>
                                            <option value="1">Enable</option>
                                            <option value="0">Disable</option>
                                        </select>
                                    </div>
                                    <div class="mb-3 col-md-3">
                                        <label for="exampleInputEmail1" class="form-label">Image</label>
                                        <input type="file" name="file_image[]" multiple id="file_image" onchange="showImagePreview(this)" class="form-control form-control-sm @error('fileInput')border-danger  @enderror" id="fileInput" name="fileInput" aria-describedby="emailHelp">
                                    </div>
                                </div>
                                <div class="row" id="imagesContainer">
                                </div>
                            </div>
                        </div>
                    </div> <!-- container -->
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