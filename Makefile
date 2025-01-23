CC = g++
CC_Flages = -I. -I./src --std=c++11

# 模块编译时的目录
SubModulePath = src
SubModuleFile = $(wildcard $(SubModulePath)/*.cpp)

SubModuleObjsPath = obj
# 把源文件路径替换为目标文件路径
SubModuleObjsFile = $(patsubst $(SubModulePath)/%.cpp,$(SubModuleObjsPath)/%.o,$(SubModuleFile))

MainFile = main.cpp
# 可执行文件名称
Executable = main

all:init $(SubModuleObjsFile) $(Executable) end

$(SubModuleObjsPath)/%.o: $(SubModulePath)/%.cpp
	$(CC) $(CC_Flages) -c $< -o $@

$(Executable): $(MainFile) 
	$(CC) $(CC_Flages) $(SubModuleObjsFile) $< -o $@

.PHONY: init clear end all


init:
	@echo 以下为需要编译的文件与目标
	@echo $(SubModuleFile)
	@echo $(SubModuleObjsFile)
	@echo $(MainObj)
	@echo 编译开始 
	mkdir -p obj

clear:
	rm -rf obj 
	rm -rf main

end:
	@echo 恭喜!编译结束！
