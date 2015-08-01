#编写一个简单的递归下降解析器
#要根据一组语法规则来解析文本，以此执行相应的操作或构建一个抽象语法树来
#表示输入。
#要根据特定的语法来解析文本，应该以BNF或EBNF的形式定义出语法的正式规格。
#BNF或EBNF是规则替换或取代的一种规范形式。
#在解析过程中将输入的源码文本同语法做匹配，通过BNF来完成各种替换和扩展。

#BNF语法格式（简单的算数运算表达式 左侧的符号可以被右侧符号取代，反之亦然）
expr ::= expr + term
	| expr - term
	| term
term ::= term * factor
	| term / factor
	| factor
factor ::= ( expr )
	| NUM

#EBNF语法格式（BNF语法格式扩展 看起来比BNF更简洁）
#{...}*中的规则是可选的，*意味着零个或更多重复项。
expr ::= term { (+|-) term }*
term ::= factor { (*|/) factor }*
factor ::= ( expr )
	| NUM

#使用一个例子来举例

表达式 3 + 4 * 5

这个表达式首先被分解为标记流（token），能够得到token的表达式

token表达式 NUM + NUM * NUM

解析过程就通过替换的方式将语法匹配到输入标记
（这是一种循环，注意第一条和最后一条形成了循环，右侧没有可匹配的就结束）

expr
expr ::= term { (+|-) term }*
expr ::= factor { (*|/) factor }* { (+|-) term }*
expr ::= NUM { (*|/) factor }* { (+|-) term }*
expr ::= NUM { (+|-) term }*
expr ::= NUM + term { (+|-) term }*
expr ::= NUM + factor { (*|/) factor }* { (+|-) term }*
expr ::= NUM + NUM { (*|/) factor }* { (+|-) term }*
expr ::= NUM + NUM * factor { (*|/) factor }* { (+|-) term }*
expr ::= NUM + NUM * NUM { (*|/) factor }* { (+|-) term }*
expr ::= NUM + NUM * NUM { (+|-) term }*
expr ::= NUM + NUM * NUM

