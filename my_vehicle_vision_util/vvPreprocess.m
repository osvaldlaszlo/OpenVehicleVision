function Preprocessed = vvPreprocess(image, horizon)
% numRow = size(I, 1);
% numColumn = size(I, 2);
% vvPreprocess(image, [ceil(numRow/2):numRow;1:numColumn]); % low half
% vvPreprocess(image, [horizon:numRow;1:numColumn]); % lower than horizontal line 


Gray = im2gray(image);

% ROI不一定取某条线以下，应该是个横轴和纵轴的范围，表征一个矩形 [x1,x2;y1,y2]
% Gray = image(ceil(end/2):end, :);

if nargin < 2
	Preprocessed = Gray(ceil(end/2):end, :);
else 
	Preprocessed = Gray(horizon:end, :);
end

% 先裁剪 运算较复杂，但不要求精度，可以先将图片缩小，得到坐标后，再放大
% 分析RGB分量图 观察1-255的值的变化，直方图分布情况
% 道路区域RG值

% 即调节系数
% R G B 转灰度图的系数
% Gray = R G B

% 看颜色分布
% HSV也尝试一下 涉及复杂的颜色空间转换
% 为了提高图像增强效果，可以采用训练优化参数，评价模型
% 使得车道线更加突出

% 颜色空间的介绍和选取

% 直方图的实验

% 我们知道红+绿=黄 红+绿+蓝=白 
% 提取出车道线，可以选定 红+绿
% 比例调整

% 对比度调节，白天夜晚的同一场景需要近似输出


% 实验方法 


% <!--
% 提供对Select Area（可多选）的统计分析，反向选择的统计，两个区域的对比 
% 魔棒工具测试洪水填充法获取车道线，然后统计其中的RGB信息
% 再用魔棒工具提取出路面，对比RGB信息
 % -->

% 为了获得干净的二值特征图，

% 白平衡处理去除色彩失真
% 灰度化，突出车道，过滤光照因素的影响 
% 灰度图（阈值化时动态阈值） 建议通过直方图（像素统计信息）选定阈值分割 道路占较大面积 
% 提取出图像中的车道-特征提取往往 是否属于车道
% 直线拟合或曲线拟合中心两侧的第一条车道线（可能有多车道，其他车道无需拟合）


