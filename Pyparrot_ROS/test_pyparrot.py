from pyparrot.Minidrone import Mambo

# you will need to change this to the address of YOUR mambo
mamboAddr = "d0:3a:c7:ce:e6:3a"

# make my mambo object
# remember to set True/False for the wifi depending on if you are using the wifi or the BLE to connect
mambo = Mambo(mamboAddr, use_wifi=True)

print("trying to connect")
success = mambo.connect(num_retries=3)
print("connected: %s" % success)

if (success):
    # get the state information
    print("sleeping")
    mambo.smart_sleep(2)
    mambo.ask_for_state_update()
    mambo.smart_sleep(2)

    print("taking off!")
    mambo.safe_takeoff(5)

    #print("Flying direct: going forward (positive pitch)")
    #mambo.fly_direct(roll=0, pitch=50, yaw=0, vertical_movement=0, duration=1)

    print("Showing turning (in place) using turn_degrees")
    mambo.turn_degrees(90)
    mambo.smart_sleep(2)
    print("Flying direct: going backwards (negative pitch)")
    mambo.fly_direct(roll=0, pitch=50, yaw=0, vertical_movement=0, duration=1)
    mambo.smart_sleep(2)
    mambo.turn_degrees(90)
    mambo.smart_sleep(2)
    print("Flying direct: going backwards (negative pitch)")
    mambo.fly_direct(roll=0, pitch=50, yaw=0, vertical_movement=0, duration=1)
    mambo.smart_sleep(2)
    mambo.turn_degrees(90)
    mambo.smart_sleep(2)
    print("Flying direct: going backwards (negative pitch)")
    mambo.fly_direct(roll=0, pitch=50, yaw=0, vertical_movement=0, duration=1)
    mambo.smart_sleep(2)
    mambo.turn_degrees(90)
    mambo.smart_sleep(2)
    print("Flying direct: going backwards (negative pitch)")
    mambo.fly_direct(roll=0, pitch=50, yaw=0, vertical_movement=0, duration=1)
    mambo.smart_sleep(2)
    print("landing")

    mambo.safe_land(5)
    mambo.smart_sleep(5)

    print("disconnect")
    mambo.disconnect()