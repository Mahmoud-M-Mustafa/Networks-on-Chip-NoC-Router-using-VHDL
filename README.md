# Networks-on-Chip-NoC-Router-using-VHDL
 Design and implementation of Networks-on-Chip (NoC) Router
using VHDL. Generally, routers task is to buffer and forward data across a network in form of 
packets.
Not only used in computer network applications routers are integrated in in system-on-Chip (SoC) 
based designs to form what is known as Networks-on-Chip (NoC) applications. NoC has shorter 
communication delay providing more efficient inter-module communication. We could state that 
routers consist of four main modules input buffer, output buffer, controller and switch fabric. Briefly 
the controller gets the packets from the input buffer and uses headers and forwarding tables to 
determine the best path for forwarding the packets by configuring the switch fabric to direct the 
packets to the appropriate output buffer. There are many further classification for routers based on 
how they handle the routing process issues ( deadlock, livelock, congestion and faults) also the 
communication performance which is directly related to both algorism and routing protocol used. So, 
in order to design and implement a simple Noc router we should break the main stages into simpler 
modules and for each module we should set the specifications required so it can functional with 
complete synchronization with other modules to insure their correct integration and functionality. 
The modules should be described in an (input output) form so the designer task is to achieve the 
desired change throw the module. The designer could choose any CAD tool that supports VHDL for 
creating and testing the modules and integrating them to complete the simple NoC router. In the 
following section a detailed description for each subsystem including their digital design and 
verification flows and the steps that must be performed to complete the logic and physical synthesis
## Project Hierarachy

<img width="601" alt="image" src="https://user-images.githubusercontent.com/54421659/164108790-780b82ba-3a4c-4d3c-bd1c-169881a1c32d.png">

