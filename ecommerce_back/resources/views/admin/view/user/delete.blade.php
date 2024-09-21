<div class="card-body">
    <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header modal-colored-header bg-danger">
                    <h4 class="modal-title" id="success-header-modalLabel">Delete Slider</h4>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <p>Do you want Delete Slider ?</p>
                </div>
                <div class="modal-footer">
                    <form action="{{route('user.delete')}}" method="post">
                        @csrf
                        <input type="hidden" name="id" id="id">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-danger">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>