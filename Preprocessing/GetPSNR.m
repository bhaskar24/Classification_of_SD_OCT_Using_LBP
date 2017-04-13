% Peak signal to noise ratio
% By Bart Goossens
function PSNR = GetPSNR(A, B)

% grayscale image
if length(size(A)) == 2

    MSE  = mean(mean((A-B).^2));
    PSNR = 10*log10(255^2/MSE);
    
else
    
    [M,N,ColorComp] = size(A);
    MSE = mean(mean(mean((A-B).^2)));
    
    PSNR = 10*log10(255^2/MSE);
    
end
