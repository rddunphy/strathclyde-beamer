function X = imcolorize(I, C, shade_factor, tint_factor, clip_prctile)

arguments
    I
    C
    shade_factor = 0.15
    tint_factor = 0.15
    clip_prctile = [1 99]
end

if size(I, 3) > 1
    I = rgb2gray(I);
end

clip = prctile(I, clip_prctile, 'all');

C_min = C .* (1-shade_factor);
C_max = C + (ones(size(C))-C).*tint_factor;

R = rescale(I, C_min(1), C_max(1), InputMin=clip(1), InputMax=clip(2));
G = rescale(I, C_min(2), C_max(2), InputMin=clip(1), InputMax=clip(2));
B = rescale(I, C_min(3), C_max(3), InputMin=clip(1), InputMax=clip(2));

X = cat(3, R, G, B);

end