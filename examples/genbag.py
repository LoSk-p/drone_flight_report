from rosbag import Bag
from std_msgs.msg import String

bag = Bag("objective.bag", "w")
bag.write("/liability", String("0xaaEc8f06cd803Daf8807C5aB10660b95d385a0dC"))
bag.write("/log_hash", String("QmRTsJ4cT3Qax8bfAepTEne1rbFiPkgUApemtWCj9FhEgd"))

bag.close()

