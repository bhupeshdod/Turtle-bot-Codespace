DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
export PATH=${DIR}/.bin:${PATH}
alias ros_robot="source ${DIR}/.bin/_ros_robot"
alias ros_local="source ${DIR}/.bin/_ros_local"
source /opt/ros/humble/setup.bash
ros_local

