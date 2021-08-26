#include <cstdio>

#include "json.hpp"
#include "sum.h"
#include "gtest/gtest.h"

int main() {
  printf("Hello World!\n");

  int c = sum(1, 2);
  printf("c is %d\n", c);

  testing::InitGoogleTest();

  printf("nlohmann/json version: %d.%d.%d\n", NLOHMANN_JSON_VERSION_MAJOR,
         NLOHMANN_JSON_VERSION_MINOR, NLOHMANN_JSON_VERSION_PATCH);
}
