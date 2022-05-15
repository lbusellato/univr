#include <forecast/Controller.hpp>

namespace rpc {
class SinCurrentController : public forecast::Controller {

    float freq;
    
   public:
    /**
     * @brief Construct a new Sin Current Controller object with empty freq
     * 
     * @param freq 
     */
    SinCurrentController(float freq = 0);

    /**
     * @brief Controller initialization
     *
     * @param a vector containing the constant sinusoidal frequency
     * with the order respect
     **/
    virtual bool init(const std::vector<float>& params) override;

    /**
     * @brief Get Return the names of the parameters.
     *
     * @return std::vector<std::string>
     */
    virtual std::vector<std::string> getParamNames() const override {
        return {"Sin Freq"};
    }

    virtual float process(const forecast::IHardware* hw,
                          float ref,
                          float dref = 0,
                          float ddref = 0) override;
};
}  // namespace rpc