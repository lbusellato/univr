%% CREATE UI
ufg = uifigure('Visible', 'off', 'Position', [100 100 865 1003], 'Name', 'TRAPEZOIDAL VELOCITY PROFILE GENERATION');
GridLayout = uigridlayout(ufg,'ColumnWidth',{44,39,77,65,44,42,'1x'},'RowHeight',{22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22,22},'ColumnSpacing',5,'RowSpacing',1.619,'Padding',[5 1.62 5 1.62]);
velAxes = uiaxes(GridLayout,'XGrid','on','YGrid','on'); xlabel(velAxes, 'Time [s]'); ylabel(velAxes, 'Velocity');
velAxes.Layout.Row = [15 28]; velAxes.Layout.Column = [5 7];
accAxes = uiaxes(GridLayout,'XGrid','on','YGrid','on'); xlabel(accAxes, 'Time [s]'); ylabel(accAxes, 'Acceleration');
accAxes.Layout.Row = [29 42]; accAxes.Layout.Column = [5 7];
posAxes = uiaxes(GridLayout,'XGrid','on','YGrid','on'); xlabel(posAxes, 'Time [s]'); ylabel(posAxes, 'Position');
posAxes.Layout.Row = [1 14]; posAxes.Layout.Column =  [5 7];
AccdecelerationtimetcEditFieldLabel = uilabel(GridLayout,'HorizontalAlignment','right','Text','Acc/deceleration time (tc)'); AccdecelerationtimetcEditFieldLabel.Layout.Row = 7; AccdecelerationtimetcEditFieldLabel.Layout.Column = [1 3];
accdelTime = uieditfield(GridLayout, 'numeric', 'Value',2); accdelTime.Layout.Row = 7; accdelTime.Layout.Column = 4;
accdel = uieditfield(GridLayout, 'numeric'); accdel.Layout.Row = 9; accdel.Layout.Column = 4;
constVel = uieditfield(GridLayout, 'numeric'); constVel.Layout.Row = 8; constVel.Layout.Column = 4;
AccdecelerationddqcEditFieldLabel = uilabel(GridLayout,'HorizontalAlignment','right','Text','Acc/deceleration (ddqc)'); AccdecelerationddqcEditFieldLabel.Layout.Row = 9; AccdecelerationddqcEditFieldLabel.Layout.Column = [1 3];
ConstantvelocitydqcEditFieldLabel = uilabel(GridLayout,'HorizontalAlignment','right','Text','Constant velocity (dqc)'); ConstantvelocitydqcEditFieldLabel.Layout.Row = 8; ConstantvelocitydqcEditFieldLabel.Layout.Column = [1 3];
InitialconditionsLabel = uilabel(GridLayout,'HorizontalAlignment','right','FontWeight','bold','Text','Initial conditions'); InitialconditionsLabel.Layout.Row = 1; InitialconditionsLabel.Layout.Column = [3 4];
ConstraintsLabel = uilabel(GridLayout,'HorizontalAlignment','center','FontWeight','bold','Text','Constraints'); ConstraintsLabel.Layout.Row = 6; ConstraintsLabel.Layout.Column = [3 4];
delPointDD = uidropdown(GridLayout); delPointDD.Layout.Row = 17; delPointDD.Layout.Column = 4;
px = uieditfield(GridLayout, 'numeric');px.Layout.Row = 16;px.Layout.Column = 4;
addPointBtn = uibutton(GridLayout, 'push','Text','ADD POINT'); addPointBtn.Layout.Row = 16; addPointBtn.Layout.Column = [1 3];
addPointBtn.ButtonPushedFcn = @(btn, event) addBtnButtonPushed(btn, event, delPointDD, px.Value);
delPoitnBtn = uibutton(GridLayout, 'push','Text','DELETE POINT'); delPoitnBtn.Layout.Row = 17; delPoitnBtn.Layout.Column = [1 3];
delPoitnBtn.ButtonPushedFcn = @(btn, event) delBtnButtonPushed(btn, event, delPointDD);
MaximumvelocitydqcmaxEditFieldLabel = uilabel(GridLayout,'HorizontalAlignment','right','Text','Maximum velocity (dqc max)'); MaximumvelocitydqcmaxEditFieldLabel.Layout.Row = 13; MaximumvelocitydqcmaxEditFieldLabel.Layout.Column = [1 3];
maxVel = uieditfield(GridLayout, 'numeric'); maxVel.Layout.Row = 13; maxVel.Layout.Column = 4;
MaxaccelerationddqcmaxEditFieldLabel = uilabel(GridLayout,'HorizontalAlignment','right','Text','Max acceleration (ddqc max)'); MaxaccelerationddqcmaxEditFieldLabel.Layout.Row = 10; MaxaccelerationddqcmaxEditFieldLabel.Layout.Column = [1 3];
maxAcc = uieditfield(GridLayout, 'numeric'); maxAcc.Layout.Row = 10; maxAcc.Layout.Column = 4;
MultipointtrajectoryLabel = uilabel(GridLayout,'HorizontalAlignment','center','Text','Multi-point trajectory','FontWeight','bold'); MultipointtrajectoryLabel.Layout.Row = 15; MultipointtrajectoryLabel.Layout.Column = [3 4];
InitialvelocitydqiLabel = uilabel(GridLayout,'HorizontalAlignment','right','Text','Initial velocity (dqi)'); InitialvelocitydqiLabel.Layout.Row = 11; InitialvelocitydqiLabel.Layout.Column = [2 3];
initVel = uieditfield(GridLayout, 'numeric');initVel.Layout.Row = 11;initVel.Layout.Column = 4;
FinalvelocitydqfLabel = uilabel(GridLayout);FinalvelocitydqfLabel.HorizontalAlignment = 'right';FinalvelocitydqfLabel.Layout.Row = 12;FinalvelocitydqfLabel.Layout.Column = [2 3];FinalvelocitydqfLabel.Text = 'Final velocity (dqf)';
finVel = uieditfield(GridLayout, 'numeric');finVel.Layout.Row = 12;finVel.Layout.Column = 4;
InitialpositionqiEditFieldLabel = uilabel(GridLayout);InitialpositionqiEditFieldLabel.HorizontalAlignment = 'right';InitialpositionqiEditFieldLabel.Layout.Row = 2;InitialpositionqiEditFieldLabel.Layout.Column = [1 3];InitialpositionqiEditFieldLabel.Text = 'Initial position (qi)';
initialPos = uieditfield(GridLayout, 'numeric');initialPos.Layout.Row = 2;initialPos.Layout.Column = 4;
FinalpositionqfEditFieldLabel = uilabel(GridLayout);FinalpositionqfEditFieldLabel.HorizontalAlignment = 'right';FinalpositionqfEditFieldLabel.Layout.Row = 3;FinalpositionqfEditFieldLabel.Layout.Column = [2 3];FinalpositionqfEditFieldLabel.Text = 'Final position (qf)';
finalPos = uieditfield(GridLayout, 'numeric');finalPos.Layout.Row = 3;finalPos.Layout.Column = 4;finalPos.Value = 5;
InitialtimetiEditFieldLabel = uilabel(GridLayout);InitialtimetiEditFieldLabel.HorizontalAlignment = 'right';InitialtimetiEditFieldLabel.Layout.Row = 4;InitialtimetiEditFieldLabel.Layout.Column = 3;InitialtimetiEditFieldLabel.Text = 'Initial time (ti)';
initialTime = uieditfield(GridLayout, 'numeric');initialTime.Layout.Row = 4;initialTime.Layout.Column = 4;
FinaltimetfEditFieldLabel = uilabel(GridLayout);FinaltimetfEditFieldLabel.HorizontalAlignment = 'right';FinaltimetfEditFieldLabel.Layout.Row = 5;FinaltimetfEditFieldLabel.Layout.Column = 3;FinaltimetfEditFieldLabel.Text = 'Final time (tf)';
finalTime = uieditfield(GridLayout, 'numeric');finalTime.Layout.Row = 5;finalTime.Layout.Column = 4;finalTime.Value = 10;
recomputeBtn = uibutton(GridLayout, 'push');
recomputeBtn.Layout.Row = 14;
recomputeBtn.Layout.Column = [1 4];
recomputeBtn.Text = 'RECOMPUTE TRAJECTORY';
recomputeBtn.ButtonPushedFcn = @(btn, event) recomputeBtnButtonPushed(btn, event, ...
    posAxes, velAxes, accAxes,...
    initialTime.Value, finalTime.Value, initialPos.Value, finalPos.Value, ...
    accdelTime.Value, constVel.Value, accdel.Value, initVel.Value, finVel.Value, ...
    maxAcc.Value, maxVel.Value);
velCorrCB = uicheckbox(GridLayout); velCorrCB.Layout.Row = 18; velCorrCB.Layout.Column = 4;
velCorrCB.Text = "smooth";
multiBtn = uibutton(GridLayout, 'push');
multiBtn.Layout.Row = 18;
multiBtn.Layout.Column = [1 3];
multiBtn.Text = 'COMPUTE MULTIPOINT';
multiBtn.ButtonPushedFcn = @(btn, event) multiBtnButtonPushed(btn, event, ...
    posAxes, velAxes, accAxes, maxAcc.Value, maxVel.Value, delPointDD, velCorrCB.Value);

ufg.Visible = 'on';

%% RECOMPUTE TRAJECTORY
function recomputeBtnButtonPushed(~,~,posAxes, velAxes, accAxes, ti, tf, qi, qf, tc, vc, ac, dqi, dqf, am, vm)
    if tc~=0
        vc = nan; ac = nan; dqi = nan; dqf = nan; am = nan; vm = nan;
    elseif vc~=0 && ac~=0
        tc = nan; dqi = nan; dqf = nan; am = nan; vm = nan;
    elseif vc~=0
        tc = nan; ac = nan; dqi = nan; dqf = nan; am = nan; vm = nan;
    elseif ac~=0
        tc = nan; vc = nan; dqi = nan; dqf = nan; am = nan; vm = nan;
    elseif am~=0
        tc = nan; vc = nan; ac = nan; 
        if vm==0
            vm = nan;
        end            
    end
    [q,v,a,t] = generateTrapezoidal(ti, tf, qi, qf, tc, vc, ac, dqi, dqf, am, vm);
    plot(posAxes,t,q,'LineWidth',2);
    plot(velAxes,t,v,'LineWidth',2);
    plot(accAxes,t,a,'LineWidth',2);
end

%% MULTIPOINT TRAJECTORY
function multiBtnButtonPushed(~,~,posAxes, velAxes, accAxes, am, vm, dd, cb)
    if vm==0
        vm = nan;
    end   
    qks = dd.ItemsData;
    sz = size(qks, 2);
    tks = zeros(1, sz);
    dqk = zeros(1,sz); 
    if cb % Implement velocity selection rule
        for i = 2:sz-1
            if sign(qks(1,i)-qks(1,i-1))==sign(qks(1,i+1)-qks(1,i))
                dqk(1,i) = sign(qks(1,i)-qks(1,i-1))*vm;
            else
                dqk(1,i) = 0;
            end
        end
    end
    q = []; v = []; a = []; t = []; markers = [1];
    % Iteratively construct the multipoint trajectory
    for k=1:sz-1
        [qk,vk,ak,tk] = generateTrapezoidal(tks(1,k),tks(1,k+1),qks(1,k),qks(1,k+1),nan,nan,nan,dqk(1,k),dqk(1,k+1),am,vm);
        tks(1,k+1) = tk(size(tk, 2));
        q = [q qk]; v = [v vk]; a = [a ak]; t = [t tk]; 
        markers = [markers size(t,2)];
    end
    plot(posAxes,t,q,'-o','MarkerIndices',markers,'MarkerEdgeColor','r','LineWidth',2);
    plot(velAxes,t,v,'-o','MarkerIndices',markers,'MarkerEdgeColor','r','LineWidth',2);
    plot(accAxes,t,a,'-o','MarkerIndices',markers,'MarkerEdgeColor','r','LineWidth',2);

end

%% DELETE POINT BUTTON
function delBtnButtonPushed(~,~,dd)
    i = find(dd.ItemsData==dd.Value);
    dd.ItemsData(i) = [];
    dd.Items(i) = [];
end

%% ADD POINT BUTTON
function addBtnButtonPushed(~,~,dd, q)
    dd.Items = [dd.Items string(q)];
    dd.ItemsData = [dd.ItemsData q];
end