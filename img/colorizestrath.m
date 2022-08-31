corpblue = [0, 0.1255, 0.3765];
engblue = [0.0039, 0.4667, 0.6784];
scigreen = [0.3647, 0.5882, 0.1922];
hassorange = [0.9569, 0.4784, 0.1294];
sbsred = [0.9333, 0.1882, 0.1412];

% for tint colours: engblue + (ones(size(engblue))-engblue).*0.5

imwrite(imcolorize(imread('strath_corp_bw.png'), corpblue), 'strasbsredth_corp.png');
imwrite(imcolorize(imread('strath_eng_bw.png'), engblue), 'strath_eng.png');
imwrite(imcolorize(imread('strath_sci_bw.png'), scigreen), 'strath_sci.png');
imwrite(imcolorize(imread('strath_hass_bw.png'), hassorange), 'strath_hass.png');
imwrite(imcolorize(imread('strath_sbs_bw.png'), sbsred), 'strath_sbs.png');

block = imread('strath_corp_block_bw.png');
imwrite(imcolorize(block, corpblue), 'strath_corp_block.png');
imwrite(imcolorize(block, scigreen), 'strath_corp_exampleblock.png');
imwrite(imcolorize(block, sbsred), 'strath_corp_alertblock.png');
imwrite(imcolorize(overlaylogo(block), corpblue), 'strath_corp_frame_title.png');

block = imread('strath_eng_block_bw.png');
imwrite(imcolorize(block, engblue), 'strath_eng_block.png');
imwrite(imcolorize(block, scigreen), 'strath_eng_exampleblock.png');
imwrite(imcolorize(block, sbsred), 'strath_eng_alertblock.png');
imwrite(imcolorize(overlaylogo(block), engblue), 'strath_eng_frame_title.png');

block = imread('strath_sci_block_bw.png');
imwrite(imcolorize(block, engblue), 'strath_sci_block.png');
imwrite(imcolorize(block, scigreen), 'strath_sci_exampleblock.png');
imwrite(imcolorize(block, sbsred), 'strath_sci_alertblock.png');
imwrite(imcolorize(overlaylogo(block), scigreen), 'strath_sci_frame_title.png');

block = imread('strath_hass_block_bw.png');
imwrite(imcolorize(block, hassorange), 'strath_hass_block.png');
imwrite(imcolorize(block, scigreen), 'strath_hass_exampleblock.png');
imwrite(imcolorize(block, sbsred), 'strath_hass_alertblock.png');
imwrite(imcolorize(overlaylogo(block), hassorange), 'strath_hass_frame_title.png');

block = imread('strath_sbs_block_bw.png');
imwrite(imcolorize(block, engblue), 'strath_sbs_block.png');
imwrite(imcolorize(block, scigreen), 'strath_sbs_exampleblock.png');
imwrite(imcolorize(block, sbsred), 'strath_sbs_alertblock.png');
imwrite(imcolorize(overlaylogo(block), sbsred), 'strath_sbs_frame_title.png');


function banner = overlaylogo(block)
    if size(block, 3) > 1
        block = rgb2gray(block);
    end
    if isa(block, 'uint8')
        block = double(block)./255;
    end
    f = block(1:130,:);
    [~,~,logo_alpha]=imread('strath_logo_small.png');
    new_height = 120;
    logo_alpha = imresize(logo_alpha, [new_height, round(size(logo_alpha,2)*new_height/size(logo_alpha,1))]);
    logo_alpha = double(logo_alpha)./255;
    la = zeros(size(f));
    y_offset = 10;
    x_offset = 1152;
    la(y_offset:y_offset+size(logo_alpha,1)-1, x_offset:x_offset+size(logo_alpha,2)-1) = logo_alpha;
    banner = f + (la.*(1-f));
end