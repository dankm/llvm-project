// RUN: %clang_cc1 -fmacro-prefix-map=%p=./UNLIKELY_PATH/empty -S %s -emit-llvm -o - | FileCheck %s

template<typename f>
auto lambdatest(f&& cb) {
  const char *s = __PRETTY_FUNCTION__;
  return s;
}

int main() {
  auto *s = lambdatest([](){});
// CHECK: @"__PRETTY_FUNCTION__._Z10lambdatestIZ4mainE3$_0EDaOT_" = private unnamed_addr constant [{{[0-9]+}} x i8] c"auto lambdatest(f &&) [f = (lambda at ./UNLIKELY_PATH/empty{{/|\\\\}}{{.*}}.cpp:10:24)]\00", align 1

  return 0;
}
