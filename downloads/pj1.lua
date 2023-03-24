function sysCall_init()  
    right_wheel= sim.getObjectHandle('joint') 
    left_wheel= sim.getObjectHandle('joint2') 
    right_velocity=0 
    left_velocity=0
    speed=8
    sim.setJointTargetVelocity(right_wheel,0)
    sim.setJointTargetVelocity(left_wheel,0)
 
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
                    
                    sim.setJointTargetVelocity(right_wheel,speed)
                    sim.setJointTargetVelocity(left_wheel,speed)
                end
                if (auxiliaryData[1]==2008) then -- down key
                    
                    sim.setJointTargetVelocity(right_wheel,-speed/2)
                    sim.setJointTargetVelocity(left_wheel,-speed/2)
                    
                end
                if (auxiliaryData[1]==2009) then -- left key
                    sim.setJointTargetVelocity(right_wheel,speed)
                    sim.setJointTargetVelocity(left_wheel,speed/2)
                   
                end
                if (auxiliaryData[1]==2010) then -- right key
                    sim.setJointTargetVelocity(right_wheel,speed/2)
                    sim.setJointTargetVelocity(left_wheel,speed)
                    
                end

            end
        end
        message,auxiliaryData=sim.getSimulatorMessage()
    end
end
