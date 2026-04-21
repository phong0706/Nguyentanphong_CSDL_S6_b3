-- 1. Thiết kế I/O & Ý tưởng Logic
-- Ý tưởng "Đánh dấu và Cộng"
-- Để đếm riêng số đơn bị hủy (CANCELLED) mà không làm ảnh hưởng đến tổng số đơn, chúng ta sử dụng kỹ thuật biến đổi dữ liệu trước khi đưa vào hàm tổng hợp:
-- Bước 1: Dùng CASE WHEN để quét từng dòng. Nếu status = 'CANCELLED', ta gán cho nó giá trị là 1. Ngược lại, gán giá trị là 0.
-- Bước 2: Dùng hàm SUM() để cộng tất cả các số 1 và 0 đó lại.
-- Kết quả: Tổng các số 1 chính là số lượng đơn bị hủy của tài xế đó.
-- Luồng xử lý
-- Gom nhóm: GROUP BY user_id.
-- Tính toán:
-- total_bookings: Dùng COUNT(*).
-- cancelled_bookings: Dùng SUM(CASE WHEN ... THEN 1 ELSE 0 END).
-- Lọc kết quả: Vì điều kiện nằm trên kết quả sau khi tính toán (Aggregate), ta bắt buộc phải dùng HAVING.

-- Luồng xử lý
-- 1 .Gom nhóm: GROUP BY user_id.
-- 2. Tính toán:
-- - total_bookings: Dùng COUNT(*).
-- - cancelled_bookings: Dùng SUM(CASE WHEN ... THEN 1 ELSE 0 END).
-- 3. Lọc kết quả: Vì điều kiện nằm trên kết quả sau khi tính toán (Aggregate), ta bắt buộc phải dùng HAVING.

SELECT 
    user_id,
    COUNT(*) AS total_bookings,
    SUM(CASE WHEN status = 'CANCELLED' THEN 1 ELSE 0 END) AS cancelled_bookings
FROM 
    Bookings
GROUP BY 
    user_id
HAVING 
    COUNT(*) >= 10 
    AND SUM(CASE WHEN status = 'CANCELLED' THEN 1 ELSE 0 END) > 5;