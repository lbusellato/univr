from setuptools import setup

package_name = 'ur5_pnp'

setup(
    name=package_name,
    version='0.0.0',
    packages=[package_name, 
              package_name + '/ur5', 
              package_name + '/trajectory', ],
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='Lorenzo Busellato',
    maintainer_email='lorenzo.busellato@gmail.com',
    description='Implementation of the first final assignment for the Robotics,' + 
    ' Vision and Control course @UniVR.',
    license='Apache License 2.0',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'main = ur5_pnp.main:main',
        ],
    },
)
