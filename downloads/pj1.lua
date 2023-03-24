function sysCall_init()  
    right_wheel= sim.getObjectHandle('joint') 
    left_wheel= sim.getObjectHandle('joint2') 
    right_velocity=0 
    left_velocity=0
    dVel=0.5; 
    sim.getJointVelocity(right_wheel,1000) 
    sim.getJointVelocity(left_wheel,1000) 
end
  
function sysCall_actuation()  
    message,auxiliaryData=sim.getSimulatorMessage() 
    while message~=-1 do
        if (message==sim.message_keypress) then
            if (auxiliaryData[1]==32) then
                -- right key 
                right_velocity=0 
                left_velocity=0 
                sim.setJointMaxForce(right_wheel, 0) 
                sim.setJointMaxForce(left_wheel, 0) 
                break
            else
                sim.setJointMaxForce(right_wheel, 10) 
                sim.setJointMaxForce(left_wheel, 10)
            
            
                if (auxiliaryData[1]==2007) then -- up key
                    right_velocity=right_velocity+1 
                    left_velocity=left_velocity+1
                end
                if (auxiliaryData[1]==2008) then -- down key
                    right_velocity=-1000
                    left_velocity=-1000
                end
                if (auxiliaryData[1]==2009) then -- left key
                    right_velocity=1000 
                    left_velocity=0
                end
                if (auxiliaryData[1]==2010) then -- right key
                    right_velocity=0
                    left_velocity=1000 
                end
            end
        end
        message,auxiliaryData=sim.getSimulatorMessage()
    end
    sim.getJointTargetVelocity(right_wheel,right_velocity)
    sim.getJointTargetVelocity(left_wheel,left_velocity)

end