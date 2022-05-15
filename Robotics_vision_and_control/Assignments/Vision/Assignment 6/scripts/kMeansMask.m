function M = kMeansMask(rgb, mask,n_objs)
    % KMEANSMASK  Compute the best mask matrix for an rgb image with
    % respect to clustering.
    %
    %   M = KMEANSMASK(rgb, mask) computes the binary mask M that best
    %   divides the image into meaningful clusters based on color
    %   distribution of the original image, rgb.
    %
    %   Author: Lorenzo Busellato, 2022

    % Reapply color to the shape
    I = rgb .* uint8(repmat(mask,[1 1 3]));
    % Increase contrast of the three channels
    I = cat(3,imadjust(I(:,:,1)),imadjust(I(:,:,2)),imadjust(I(:,:,3)));
    % Use the color distribution to project the image on the smallest
    % eigenvectors
    C = double(reshape(I, [numel(I(:,:,1)) 3]));
    C = C(reshape(mask, [size(C,1) 1]),:);
    % Eigenvalue/vector computation
    [U,E] = eig(cov(C));
    % Keep the two smallest eigenvectors
    [~,i] = sort(diag(E));
    U = U(:,i);
    U = U(:,1:2);
    % Center the color distribution and project
    Y = (C-mean(C,1))*U;
    % K-means clustering
    [idxs,~] = kmeans(Y,n_objs,'MaxIter',100,'Start','plus');
    % Extract the masks
    masks = false([size(mask), n_objs]);
    valid_pix = 1:numel(mask);
    valid_pix = valid_pix(reshape(mask,[1, numel(mask)]))';
    for i=1:n_objs
        tmp = false(size(mask));
        tmp(valid_pix(idxs == i)) = true;
        masks(:,:,i) = tmp;
    end
    % Keep the best mask
    [~,i] = max(sum(masks,[1 2]));
    M = masks(:,:,i);
end