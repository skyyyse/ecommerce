<script>

    var ip = '127.0.0.1:8000';

    function showImagePreview(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function(e) {
                uploadedImage.src = e.target.result;
            };
            reader.readAsDataURL(input.files[0]);
            imageName.textContent = input.files[0].name;
            imagePreview.style.display = 'block';
        } else {
            imagePreview.style.display = 'none';
        }
    }

    function slider_update(button) {
        var id = button.value;
        $.ajax({
            url: "http://127.0.0.1:8000/admin/slider/" + id,
            method: "get",
            success: function(response) {
                console.log(response);
                $("#id").val(response.slider[0].id);
                $("#title").val(response.slider[0].title);
                $("#active").val(response.slider[0].status);
                const data_image = document.getElementById('data_image');
                const image = document.getElementById('image');
                const title_image = document.getElementById('title_image');
                if (response.slider[0].image == null) {
                    data_image.style.display = 'none';
                } else {
                    data_image.style.display = 'block';
                    title_image.innerHTML = response.slider[0].title;
                    image.src = "http://" + ip + "/Image/Slider/Image/" + response.slider[0].image;
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }

    function categories_update(button) {
        var id = button.value;
        $.ajax({
            url: "http://127.0.0.1:8000/admin/categories/" + id,
            method: "get",
            success: function(response) {
                console.log(response);
                $("#slider_id").val(response.Category[0].id);
                $("#title").val(response.Category[0].title);
                $("#active").val(response.Category[0].status);
                const data_image = document.getElementById('data_image');
                const image = document.getElementById('image');
                const title_image = document.getElementById('title_image');
                if (response.Category[0].image == null) {
                    data_image.style.display = 'none';
                } else {
                    data_image.style.display = 'block';
                    title_image.innerHTML = response.Category[0].title;
                    image.src = "http://" + ip + "/Image/Categories/Image/" + response.Category[0].image;
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }

    // function categoeies_delete(button) {
    //     var id = button.value;
    //     $("#id").val(id);
    // }

    function subcategories_update(button) {
        var id = button.value;
        $.ajax({
            url: "http://127.0.0.1:8000/admin/subcategories/" + id,
            method: "get",
            success: function(response) {
                console.log(response);
                $("#slider_id").val(response.subcategories[0].id);
                $("#title").val(response.subcategories[0].title);
                $("#active").val(response.subcategories[0].status);
                const data_image = document.getElementById('data_image');
                const image = document.getElementById('image');
                const title_image = document.getElementById('title_image');
                var categories = response.subcategories[0].categories_id;
                $("#categories").val(categories);
                $("#categories option").each(function() {
                    if ($(this).val() == categories) {
                        $(this).prop("selected", true);
                    }
                });
                if (response.subcategories[0].image == null) {
                    data_image.style.display = 'none';
                } else {
                    data_image.style.display = 'block';
                    title_image.innerHTML = response.subcategories[0].title;
                    image.src = "http://" + ip + "/Image/Subcategories/Image/" + response.subcategories[0].image;
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }

    // function subcategoeies_delete(button) {
    //     var id = button.value;
    //     $("#id").val(id);
    //     console.log(id);
    // }

    function product_update(button) {
        var id = button.value;
        $.ajax({
            url: "http://127.0.0.1:8000/admin/product/" + id,
            method: "get",
            success: function(response) {
                console.log(response);
                console.log(response.product[0].image);
                const images = response.product[0].image;
                displayImages(images);
                $("#slider_id").val(response.product[0].id);
                $("#title").val(response.product[0].title);
                $("#active").val(response.product[0].status);
                const data_image = document.getElementById('data_image');
                const image = document.getElementById('image');
                const title_image = document.getElementById('title_image');
                var subcategories_id = response.product[0].subcategories_id;

                function displayImages(images) {
                    const imagesContainer = $('#imagesContainer');
                    imagesContainer.empty();
                    images.forEach(img => {
                        // const imgElement = `<img src="http://127.0.0.1:8000/Image/Product/Image/${img.image}" alt="Product Image" style="width: 100px; height: auto; margin: 5px;" />`;
                        const imgElement = `<div class="col-sm-6 col-lg-3">
                                                <div class="card">
                                                    <img src="http://127.0.0.1:8000/Image/Product/Image/${img.image}" class="card-img-top" alt="...">
                                                    <div class="card-body">
                                                        <a href="{{url('/admin/product/destroy/image?id=${img.id}')}}" class="btn btn-danger mt-2 stretched-link">Delete Image</a>
                                                    </div> 
                                                </div> 
                                            </div> `;
                        imagesContainer.append(imgElement);
                    });
                }
                $("#categories").val(subcategories_id);
                $("#categories option").each(function() {
                    if ($(this).val() == subcategories_id) {
                        $(this).prop("selected", true);
                    }
                });
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
    function user_update(button){
        var id=button.value;
        $.ajax({
            url: "http://127.0.0.1:8000/admin/user/" + id,
            method: "get",
            success: function(response) {
                console.log(response);
                $("#user_id").val(response.user[0].id);
                $("#username").val(response.user[0].username);
                $("#email").val(response.user[0].email);
                $("#phone").val(response.user[0].phone);
                $("#role").val(response.user[0].role);
                $("#textarea").val(response.user[0].address);
                const data_image = document.getElementById('data_image');
                const image = document.getElementById('image');
                const title_image = document.getElementById('title_image');
                if (response.user[0].image == null) {
                    data_image.style.display = 'none';
                } else {
                    data_image.style.display = 'block';
                    title_image.innerHTML = response.user[0].image;
                    image.src = "http://127.0.0.1:8000/Image/User/Image/"+response.user[0].image;
                }
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    }
    
    function delete_data(button){
        var id=button.value;
        $("#ids").val(id);
    }
</script>