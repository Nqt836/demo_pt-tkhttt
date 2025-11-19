<%@ page import="com.demo.dao.SupplierDAO" %>
<%@ page import="com.demo.model.Manager" %>
<%@ page import="com.demo.model.Supplier" %>
<%@ page import="java.util.regex.Pattern" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("UTF-8"); // để xử lý tiếng việt

    // lấy dữ liệu từ form
    String id = request.getParameter("supplierId");
    String name = request.getParameter("supplierName");
    String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String date = request.getParameter("addedDate"); // Trả về YYYY-MM-DD
    String tax = request.getParameter("taxCode");
    String desc = request.getParameter("description");

    String error = null; // cái này để tý dùng để xử lý lỗi

    // Kiểm tra định dạng trước
    String emailRegex = "^[A-Za-z0-9+_.-]+@gmail\\.com$"; // dấu chấm là bất kì kí tự nào nên sẽ thêm \\ trước dấu chấm
    String phoneRegex = "^0\\d{9}$"; // 10 chữ số bắt đầu bằng 0

    if(!Pattern.matches(emailRegex, email)){
        error = "Email không đúng định dạng";
    }
    else if (!Pattern.matches(phoneRegex, phone)){
        error = "Số điện thoại không hợp lệ";
    }


    // Nếu định dạng đã đúng sẽ chuyển sang kiểm tra trùng lặp trong db
    if(error == null){ // đã đúng định dạng
        SupplierDAO dao = new SupplierDAO();
        String checkDupplicate = dao.checkDuplicate(id, email, phone);
        if (checkDupplicate != null){
            // tức là đang bị trùng
            error =  "Thông tin" + checkDupplicate + "(" +
                    (checkDupplicate.equals("ID")?id : checkDupplicate.equals("Email")?email : phone) +
                    ") đã tồn tại!";

        }
        else {
            // khong bị trùng
            // Tạo đối tượng Supplier
            Supplier newSupplier =  new Supplier(id, name, address, email, phone, date, tax, desc);
            boolean isSuccess =  dao.addSupplier(newSupplier);

            if(isSuccess){// thành công
                session.setAttribute("successMessage", "Thêm nhà cung cấp " + name + "thành công!");
                response.sendRedirect("SupplierManagement.jsp"); // Chuyển hướng về trang danh sách và gọi doList để load danh sach mới
                return;
            }
            else {
                error = "Lỗi khi thêm";
            }
        }
    }
    if (error != null){
        request.setAttribute("error", error);

        // Lưu lại các giá trị để người dùng không phải gõ lại
        request.setAttribute("oldId", id);
        request.setAttribute("oldName", name);
        request.setAttribute("oldAddress", address);
        request.setAttribute("oldPhone", phone);
        request.setAttribute("oldEmail", email);
        request.setAttribute("oldTax", tax);
        request.setAttribute("oldDesc", desc);

        // quay lại trang add
        request.getRequestDispatcher("AddSupplier.jsp").forward(request, response);
    }
%>