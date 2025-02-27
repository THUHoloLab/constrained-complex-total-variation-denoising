function val = indicator(x)
% =========================================================================
% Calculate the indicator function of the constraint set.
% -------------------------------------------------------------------------
% Input:    - x   : The complex-valued 2D transmittance of the sample.
% Output:   - val : The function value.
% =========================================================================

global constraint
global absorption
global support

if strcmpi(constraint,'none')
    val = 0;
elseif strcmpi(constraint,'a')
    if sum(sum(abs(x)>absorption+eps)) == 0
        val = 0;
    else
        val = inf;
    end
elseif strcmpi(constraint,'s')
    x_res = x - x.*support;
    if sum(sum(abs(x_res))) == 0
        val = 0;
    else
        val = inf;
    end
elseif strcmpi(constraint,'as')
    x_res = x - x.*support;
    if sum(sum(abs(x_res))) == 0 && sum(sum(abs(x)>absorption+eps)) == 0
        val = 0;
    else
        val = inf;
    end
else
    error("Invalid constraint. Should be 'A'(absorption), 'S'(support), 'AS'(both), or 'none'.")
end

end


