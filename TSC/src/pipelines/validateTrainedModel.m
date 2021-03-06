
function val_model = validateTrainedModel(model)
    
    if nargin == 0 || ~isstruct(model)
        samplingSetting   = struct('method', 'hybrid', ...
                                   'param',  struct('seqlen', 52, 'stride', 25, 'sel', 4));

        descriptorSetting = struct('method', 'HOG1D', ...
                                   'param',  validateHOG1Dparam, ...
                                   'activeDims', []);

        normalizationSetting  = struct('method', 'power', ...
                                        'param', validatePowerparam);

        encoderSetting    = struct('method', 'FV', ...
                                'model', []);

        classifierSetting = struct('method', 'SVM', ...
                                   'model', [], ...
                                   'param', '-t 0 -c 10');
                               
        val_model = struct( 'sampling', samplingSetting, ...
                            'descriptor', descriptorSetting, ...
                            'normalization', normalizationSetting, ...
                            'encoder', encoderSetting, ...
                            'classifier', classifierSetting);
        return;
    end 
    
    val_model = model;
    if ~isfield(model, 'sampling')
        val_model.sampling = struct('method', 'hybrid', ...
                                   'param',  struct('seqlen', 52, 'stride', 25, 'sel', 4));
    end    
    
    if ~isfield(model, 'descriptor')        
        val_model.descriptor = struct('method', 'HOG1D', ...
                                      'param',  validateHOG1Dparam, ...
                                      'activeDims', []);
    end    
    
    if ~isfield(model, 'normalization')    
        val_model.normalization = struct('method', 'power', ...
                                         'param', validatePowerparam);
    end
    
    if ~isfield(model, 'encoder')
       val_model.encoder = struct('method', 'FV', ...
                                  'model', []);
    end

    if ~isfield(model, 'classifier')
       val_model.classifier = struct('method', 'SVM', ...
                                     'model', [], ...
                                     'param', '-t 0 -c 10');
    end    
    
end