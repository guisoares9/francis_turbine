function f = friction(Re,epsilon)

        shape = size(Re);
        Re = Re(:);
        epsilon = epsilon(:);
        f = zeros(size(Re));
        for k = 1:numel(Re)
            if Re(k) > 3500
                f(k) = fzero(@(f) 1/sqrt(f)+2*log10(epsilon(k)/3.7+2.51/(Re(k)*sqrt(f))),[eps,1]);
            elseif Re(k) < 2500
                f(k) = 64/Re(k);
            else
                f(k) = NaN;
            end
        end
        f = reshape(f,shape);

        function s = strfix(s)
            while contains(s,'0$')
                s = strrep(s,'0$','$');
            end
            s = strrep(s,'0.$','0$');
        end
    
end