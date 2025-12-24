+ Overview

This project implements a UVM-based verification environment for a UART controller (uart.v).
The verification focuses on validating correct UART transmission behavior across multiple baud rates, data lengths, parity configurations, and stop bit settings, with extensive randomized testing and functional coverage collection using QuestaSim, executed via Cygwin on Windows.

+ tool: Questasim, Cygwin

+ Implemented Tests

uart_test –> Basic UART functionality test

rand_baud_test –> Random baud rate verification

rand_baud_with_2_stop_test –> Random baud rate with 2 stop bits

rand_baud_len5_test / len6 / len7 / len8 –> Random baud with variable data length

rand_baud_len5p / len6p / len7p / len8p –> Random baud with parity enabled


+ Functional Coverage

Functional coverage is collected using UCDB

HTML coverage reports are automatically generated and available at: sim/cov/html/index.html


<img width="291" height="277" alt="image" src="https://github.com/user-attachments/assets/a32b7076-fc28-4c4d-a4c8-ea7208d1a68f" />


<img width="523" height="366" alt="image" src="https://github.com/user-attachments/assets/7ff042ec-cc20-4244-8425-3d8894435f9f" />

