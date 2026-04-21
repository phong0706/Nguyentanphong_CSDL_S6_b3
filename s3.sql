-- 1. Thiết kế I/O & Luồng xử lý (Tầng Backend)
-- Đầu vào (Input) & Đầu ra (Output)
-- Input: minTrustScore (tham số cấu hình từ Admin), locationOrder (vị trí đơn hàng).
-- Output: Danh sách các tài xế thỏa mãn điều kiện, được sắp xếp theo độ ưu tiên.
-- Luồng xử lý Logic (Pseudo-code):
-- Nếu Admin nhập số âm, hệ thống sẽ gặp lỗi logic nghiêm trọng (cho phép tài xế điểm cực thấp nhận đơn). Chúng ta cần xử lý như sau:
-- 1. Nhận giá trị minTrustScore từ hệ thống.
-- 2. Kiểm tra điều kiện:
-- + Nếu minTrustScore < 0:
-- + Gán giá trị mặc định là 80 (theo yêu cầu nghiệp vụ cơ bản).
-- + (Hoặc) Trả về lỗi yêu cầu Admin nhập lại giá trị hợp lệ.
-- 3. Xác thực: Đảm bảo minTrustScore luôn là số dương trước khi truyền vào câu lệnh SQL.
-- 4.Gọi SQL với tham số đã được làm sạch.

SELECT 
    driver_id, 
    driver_name, 
    status, 
    trust_score, 
    distance_km
FROM 
    Drivers
WHERE 
    status = 'AVAILABLE' 
    AND trust_score >= 80
ORDER BY 
    distance_km ASC, 
    trust_score DESC;