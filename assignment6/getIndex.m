function idx = getIndex(s1, s2)
    indicies = {
    ',1', ',2', ',3', ',4', ...
    ',12', ',13', ',14', ',23', ',24', ',34', ...
    '1,', '1,2', '1,3', '1,4', ...
    '2,', '2,1', '2,3', '2,4', ...
    '3,', '3,1', '3,2', '3,4', ...
    '4,', '4,1', '4,2', '4,3', ...
    '12,', '13,', '14,', '23,', '24,', '34,'
    };
    
%     indicies = {
%     ',1', ',2', ',3', ',4', ',5', ...
%     ',12', ',13', ',14', ',15', ',23', ',24', ',25', ',34', ',35', '45,', ...
%     '1,', '1,2', '1,3', '1,4', '1,5', ...
%     '2,', '2,1', '2,3', '2,4', '2,5',...
%     '3,', '3,1', '3,2', '3,4', '3,5', ...
%     '4,', '4,1', '4,2', '4,3', '4,5', ...
%     '5,', '5,1', '5,2', '5,3', '5,4', ...
%     '12,', '13,', '14,', '15,', '23,', '24,', '25,', '34,', '35,', '45,'
%     };

    % Generate correct string from given sets
    str1 = '';
    if length(s1) == 1
        str1 = int2str(s1(1));
    elseif length(s1) == 2
        str1 = strcat(int2str(min(s1)), int2str(max(s1)));
    end
    
    str2 = '';
    if length(s2) == 1
        str2 = int2str(s2(1));
    elseif length(s2) == 2
        str2 = strcat(int2str(min(s2)), int2str(max(s2)));
    end
    
    g = strcat(strcat(str1, ','),str2);
    [res, idx] = ismember(g, indicies);
    if res == 0
        display('Something went wrong in Index Search');
    end
end