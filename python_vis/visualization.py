#!/usr/bin/python

import numpy as np
import matplotlib.pyplot as plt
from scipy.misc import imread
from time import sleep

def readVerilog(filename):
	f = open(filename, 'r')
	results = f.readlines()

	numerical_results = []
	for result in results:
		numerical_results.append(result.replace('\n', ''))

	return numerical_results


def translateStates(states):
	"""
	INPUT: Take list of intersection states in raw strings
	OUTPUT: List of intersection states broken down by light
	"""
	light_states = []
	light_map = {}

	for state in states:
		lights = []
		for i in range(0, len(state)):
			if (i+1) % 3 == 0:
				lights.append(state[i-2:i+1])
		light_states.append(lights)

	return light_states


def visualizeStates(state_map, background):
	"""
	INPUT: Take list of intersection states
		   Each intersection state is list of light states
	OUTPUT: Visualization of intersection states
	"""

	color_map = {'100': 'r', '010': 'y', '001': 'g', '111': 'w'}

	l1_color = color_map['100']
	l2_color = color_map['100']
	l3_color = color_map['100']
	l4_color = color_map['100']
	p1_color = color_map['100']
	p2_color = color_map['100']
	p3_color = color_map['100']
	p4_color = color_map['100']

	plt.ion()

	img = imread(background)
	plt.imshow(img)

	# Light 1
	plt.scatter(112, 95, marker='o', c=l1_color, s = 75)

	# Light 2
	plt.scatter(146, 160, marker='o', c=l2_color, s = 75)

	# Light 3
	plt.scatter(165, 111, marker='o', c=l3_color, s = 75)

	# Light 4
	plt.scatter(90, 143, marker='o', c=l4_color, s = 75)

	# Ped 1
	plt.scatter(90, 143, marker='o', c=p1_color, s = 50)

	# Ped 2
	plt.scatter(90, 143, marker='o', c=p2_color, s = 50)

	# Ped 3
	plt.scatter(90, 143, marker='o', c=p3_color, s = 50)

	# Ped 4
	plt.scatter(90, 143, marker='o', c=p4_color, s = 50)

	plt.pause(0.05)

	for state in state_map:

		# Set color values
		l1_color = color_map[state[0]]
		l2_color = color_map[state[1]]
		l3_color = color_map[state[2]]
		l4_color = color_map[state[3]]
		p1_color = color_map[state[4]]
		p2_color = color_map[state[5]]
		p3_color = color_map[state[6]]
		p4_color = color_map[state[7]]

		# Light 1
		plt.scatter(112, 95, marker='o', c=l1_color, s = 75)

		# Light 2
		plt.scatter(146, 160, marker='o', c=l2_color, s = 75)

		# Light 3
		plt.scatter(165, 111, marker='o', c=l3_color, s = 75)

		# Light 4
		plt.scatter(90, 143, marker='o', c=l4_color, s = 75)

		# Ped 1
		plt.scatter(75, 75, marker='o', c=p1_color, s = 50)

		# Ped 2
		plt.scatter(180, 175, marker='o', c=p2_color, s = 50)

		# Ped 3
		plt.scatter(180, 75, marker='o', c=p3_color, s = 50)

		# Ped 4
		plt.scatter(75, 175, marker='o', c=p4_color, s = 50)

		plt.pause(0.05)

		sleep(1)

	return True




if __name__ == '__main__':
	states = readVerilog("sim.txt")
	light_states = translateStates(states)
	visualizeStates(light_states, "intersection.ico")
