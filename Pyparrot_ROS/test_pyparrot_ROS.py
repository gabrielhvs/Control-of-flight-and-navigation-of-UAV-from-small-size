#!/usr/bin/env python

from pyparrot.Minidrone import Mambo
import rospy
from std_msgs.msg import String

# you will need to change this to the address of YOUR mambo
mamboAddr = "d0:3a:c7:ce:e6:3a"

# make my mambo object
# remember to set True/False for the wifi depending on if you are using the wifi or the BLE to connect
mambo = Mambo(mamboAddr, use_wifi=False)

print("trying to connect")
success = mambo.connect(num_retries=3)
print("connected: %s" % success)
command = ""

class Ros_Drne_Plugin:

    def __init__(self):

        self.rospy=rospy
        self.rospy.init_node('serial_node', anonymous=True)
        self.rate = rospy.Rate(10)
        self.command=""
        self.rospy.Subscriber('/command', String, self.callback, queue_size=10)
        self.rate = rospy.Rate(10)

    def callback(self, data):

        self.command = data.data
        



if __name__ == '__main__':

    mambo_plugin = Ros_Drne_Plugin()

    while (success):
        # get the state information
        print("sleeping")
        mambo.smart_sleep(2)
        mambo.ask_for_state_update()
        mambo.smart_sleep(2)
        a = input("enter")
        if(mambo_plugin.command == "t"):

            print("taking off!")
            mambo.safe_takeoff(5)

        elif (mambo_plugin.command == "y"):
    
            print("Showing turning (in place) using turn_degrees")
            mambo.turn_degrees(90)
            mambo.smart_sleep(2)

        elif (mambo_plugin.command == "f"):
            print("Flying direct: going backwards (negative pitch)")
            mambo.fly_direct(roll=0, pitch=50, yaw=0, vertical_movement=0, duration=0.5)

        elif (mambo_plugin.command == "f"):

            print("landing")
            mambo.safe_land(5)
            mambo.smart_sleep(5)

            print("disconnect")
            mambo.disconnect()
        else:
            print("No command")