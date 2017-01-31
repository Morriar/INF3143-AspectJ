#  Copyright 2016 Alexandre Terrasa <alexandre@moz-code.org>.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

classes:
	mkdir -p classes/
	javac src/inf3143/aspectj/*.java -d classes

weaved: classes
	ajc -inpath classes/ -cp ~/dev/tools/aspectj1.8/lib/aspectjrt.jar:classes/ src/inf3143/aspectj/*.aj -d weaved

run: weaved
	java -cp ~/dev/tools/aspectj1.8/lib/aspectjrt.jar:weaved/ inf3143.aspectj.Main

clean:
	rm -rf classes/ weaved/
