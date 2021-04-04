% scripts to add folder names according to PC names

if strcmp(getenv('computername'),'TRITSCHPC006') %
    sever_movie_fd = 'R:\tritsn01lab\tritsn01labspace\Haixin\Movies';
    save_path = 'R:\tritsn01lab\tritsn01labspace\Haixin\Project\Data_mat';
    WS_path = 'R:\tritsn01lab\tritsn01labspace\Haixin\Data';%190705\HL060\WS
elseif strcmp(getenv('computername'),'DESKTOP-B2F7899') % Lucy PC
    sever_movie_fd = 'R:\Haixin\Movies';
    save_path = 'R:\Haixin\Project\Data_mat';
    WS_path = 'R:\Haixin\Data';%190705\HL060\WS
elseif strcmp(getenv('computername'),'ACLSETPC05') % Pratik
    sever_movie_fd = 'R:\tritsn01lab\tritsn01labspace\Haixin\Movies';
    save_path = 'R:\tritsn01lab\tritsn01labspace\Haixin\Project\Data_mat';
    WS_path = 'R:\tritsn01lab\tritsn01labspace\Haixin\Data';%190705\HL060\WS
elseif strcmp(getenv('computername'),'TRITSCHPC0002') % Katie PC
    sever_movie_fd = 'R:\tritsn01lab\tritsn01labspace\Haixin\Movies';
    save_path = 'R:\tritsn01lab\tritsn01labspace\Haixin\Project\Data_mat';
    WS_path = 'R:\tritsn01lab\tritsn01labspace\Haixin\Data';%190705\HL060\WS % R:\tritsn01lab\tritsn01labspace\Haixin\Project
else
    warning('PC not included, Type in names');
    save_path = input('Type in folder name for saving the processed data on server. e.g., R:\tritsn01lab\tritsn01labspace\Haixin\Project\Data_mat', 's');
    WS_path = input('Type in folder name for saving the WS folder on server. e.g., R:\tritsn01lab\tritsn01labspace\Haixin\Data', 's');%190705\HL060\WS
    
end
