function a = angleBetweenLines(m1, m2)
    % ANGLEBETWEENLINES Computes the angle between two lines.
    %
    % a = ANGLEBETWEENLINES(m1,m2) returns the angle between the lines
    % whose directions are respectively m1 and m2.
    %
    a = acosd((m1'*m2)/(norm(m1)*norm(m2)));
end