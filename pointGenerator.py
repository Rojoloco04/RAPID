import math

R = 25000  # radius in micrometres (25 mm, within 33 mm disc range)
N = 1000
start_deg = 0
step_deg = 360.0 / N

points = []
for i in range(N):
    theta = math.radians(start_deg - i * step_deg)
    x = int(round(R * math.cos(theta)))
    y = int(round(R * math.sin(theta)))
    points.append((x, y))

print("XY", points[0][0], ":", points[0][1])
for x, y in points[1:]:
    print(f"{x}: {y}")