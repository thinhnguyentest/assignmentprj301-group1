// Thêm các hàm xử lý sự kiện tương ứng cho Người dùng
function showUserForm() {
    document.getElementById("userForm").style.display = "block";
}

function cancelUserForm() {
    document.getElementById("userForm").style.display = "none";
}

function editUser(userId) {
    var row = document.querySelector(`[data-user-id="${userId}"]`);
    document.getElementById("action").value = "update";
    
    var id = row.dataset.userId;
    var username = row.dataset.userUsername;
    var password = row.dataset.userPassword;
    var name = row.dataset.userName;
    var email = row.dataset.userEmail;
    var phone = row.dataset.userPhone;
    var address = row.dataset.userAddress;
    var role = row.dataset.userRole;
    var isActive = row.dataset.userIsActive;    

    document.getElementById("userId").value = id ;
    document.getElementById("username").value = username;
    document.getElementById("password").value = password;
    document.getElementById("name").value = name;
    document.getElementById("email").value = email;
    document.getElementById("phone").value = phone;
    document.getElementById("address").value = address;
    document.getElementById("role").value = role;
    document.getElementById("isActive").value = isActive;
    
    console.log(username, password, name, email, phone, address, role, isActive);
    showUserForm();
}

function addBook() {
    resetBookForm();
    document.getElementById("action").value = "add";
    document.getElementById("bookForm").style.display = "block";
}

function cancelBookForm() {
    document.getElementById("bookForm").style.display = "none";
}

function editBook(bookId) {
    document.getElementById("authorId").value = document.getElementById("authorId_" + bookId).value;
    document.getElementById("authorName").value = document.getElementById("authorName_" + bookId).value;
    document.getElementById("birthday").value = document.getElementById("authorBirthday_"+ bookId).value;
    document.getElementById("bio").innerHTML = document.getElementById("authorBio_"+ bookId).value;
    
    document.getElementById("publisherId").value = document.getElementById("publisherId_"+ bookId).value;
    document.getElementById("publisherName").value = document.getElementById("publisherName_"+ bookId).value;
    document.getElementById("establishedDate").value = document.getElementById("establishedDate_"+ bookId).value;
    
    document.getElementById("bookId").value = document.getElementById("bookId_"+ bookId).value;
    document.getElementById("bookTitle").value = document.getElementById("bookTitle_"+ bookId).value;
    document.getElementById("genre").value = document.getElementById("genre_"+ bookId).value;
    document.getElementById("description").innerHTML = document.getElementById("description_"+ bookId).value;
    document.getElementById("quantity").value = document.getElementById("quantity_"+ bookId).value;
    document.getElementById("price").value = document.getElementById("price_"+ bookId).value;
    document.getElementById("image").value = document.getElementById("image_"+ bookId).value;

    // Display the bookForm
    document.getElementById("action").value = "update";
    document.getElementById("bookForm").style.display = "block";
}

function resetBookForm() {
    document.getElementById("authorId").value = "";
    document.getElementById("authorName").value = "";
    document.getElementById("birthday").value = "";
    document.getElementById("bio").innerHTML = "";
    
    document.getElementById("publisherId").value = "";
    document.getElementById("publisherName").value = "";
    document.getElementById("establishedDate").value = "";
    
    document.getElementById("bookId").value = "";
    document.getElementById("bookTitle").value = "";
    document.getElementById("genre").value = "";
    document.getElementById("description").innerHTML = "";
    document.getElementById("quantity").value = "";
    document.getElementById("price").value = "";    
    document.getElementById("image").innerHTML = "";
}

