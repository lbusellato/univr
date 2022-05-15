#include "SinusoidalCurrentController.hpp"
#include <forecast/config/escon_motor.h>
#include <cmath>

using namespace rpc;

SinCurrentController::SinCurrentController(float freq)
    : Controller(1), freq(freq) {
    // ntd
}

bool SinCurrentController::init(const std::vector<float>& params) {
    if (params.size() < 1)
        return (initialized = false);

    freq = params[0];

    return (initialized = freq > 0);
}

float SinCurrentController::process(const forecast::IHardware* hw,
                                    float ref,
                                    float dref,
                                    float ddref) {
    auto t = hw->getT();
    return std::sin(2 * M_PI * freq * t);
}