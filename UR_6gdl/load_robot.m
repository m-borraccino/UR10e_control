function [ur10e_bis,ur10e] = load_robot()

    %load preloaded robot from Matlab library
    ur10e = loadrobot("universalUR10");
    removeBody(ur10e,'tool0');
    ur10e.DataFormat = 'column';
    
    % Create a equivalent robot with DH parameters
    l1  = 0.1273;
    l21 = 0.2209;
    l22 = 0.6120;
    l31 = 0.1719;
    l32 = 0.5723;
    l4  = 0.1149;
    l5  = 0.1157;
    l6  = 0.0922;
    
    dhparams = [0   	-pi/2	l1   	0;
                l22	    0       l21     0;
                l32  	0	    -l31	0;
                0   	-pi/2	l4	    0;
                0       pi/2	l5   	0;
                0       0       l6      0];
    
    ur10e_bis = rigidBodyTree;
    ur10e_bis.DataFormat = 'column';
    bodies = cell(6,1);
    joints = cell(6,1);
    for i = 1:6
        bodies{i} = rigidBody(['body' num2str(i)]);
        joints{i} = rigidBodyJoint(['jnt' num2str(i)],"revolute");
    
        setFixedTransform(joints{i},dhparams(i,:),"dh");
        bodies{i}.Joint = joints{i};
        if i == 1 % Add first body to base
            addBody(ur10e_bis,bodies{i},"base")
        else % Add current body to previous body by name
            addBody(ur10e_bis,bodies{i},bodies{i-1}.Name)
        end
    end

end