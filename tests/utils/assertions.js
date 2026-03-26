/**
 * promptfoo 自定义断言函数
 * 用于 oh-my-fangirl Skill 质量测试
 */

/**
 * 检测输出是否包含指定模式的核心称呼
 * @param {string} output - AI 输出
 * @param {string} modeId - 模式 ID
 * @param {object} context - 上下文
 * @returns {{pass: boolean, score: number, reason: string}}
 */
function hasCorrectPersona(output, modeId, context) {
  const personaMap = {
    fangirl: {
      address: ['哥哥'],
      self: ['人家'],
      forbidden: ['父王', '儿臣', '弟弟', '姐姐']
    },
    fuwang: {
      address: ['父王'],
      self: ['儿臣', '女儿'],
      forbidden: ['哥哥', '人家', '宝贝']
    },
    jiejie: {
      address: ['弟弟', '你'],
      self: ['姐姐'],
      forbidden: ['加油', '厉害', '哥哥', '父王']
    },
    zen: {
      address: ['你'],
      self: [],
      forbidden: ['太棒了', '厉害', '加油', '哥哥', '父王']
    },
    love: {
      address: ['你', '宝贝'],
      self: [],
      forbidden: ['奖励', '哥哥', '父王', '儿臣']
    },
    oneesan: {
      address: ['小朋友', '小坏蛋'],
      self: [],
      forbidden: ['oh no', '完了', '哥哥', '父王']
    },
    zhiyin: {
      address: ['你'],
      self: [],
      forbidden: ['你好棒', '你好厉害', '太棒了', '哥哥', '父王']
    }
  };

  const persona = personaMap[modeId];
  if (!persona) {
    return { pass: false, score: 0, reason: `未知模式: ${modeId}` };
  }

  let score = 0;
  const issues = [];

  // 检查称呼
  if (persona.address.length > 0) {
    const hasAddress = persona.address.some(addr => output.includes(addr));
    if (hasAddress) {
      score += 0.4;
    } else {
      issues.push(`缺少正确称呼: ${persona.address.join(', ')}`);
    }
  }

  // 检查自称
  if (persona.self.length > 0) {
    const hasSelf = persona.self.some(self => output.includes(self));
    if (hasSelf) {
      score += 0.3;
    } else {
      issues.push(`缺少正确自称: ${persona.self.join(', ')}`);
    }
  }

  // 检查禁忌词
  const hasForbidden = persona.forbidden.some(word => output.includes(word));
  if (hasForbidden) {
    const foundForbidden = persona.forbidden.filter(word => output.includes(word));
    issues.push(`包含禁忌词: ${foundForbidden.join(', ')}`);
    score -= 0.3;
  }

  const pass = score >= 0.4 && !hasForbidden;

  return {
    pass,
    score: Math.max(0, Math.min(1, score)),
    reason: issues.length > 0 ? issues.join('; ') : '人设一致'
  };
}

/**
 * 检测输出长度是否符合极简模式要求
 * @param {string} output - AI 输出
 * @param {number} maxLength - 最大长度（默认 10）
 * @returns {{pass: boolean, score: number, reason: string}}
 */
function isMinimalLength(output, maxLength = 10) {
  const length = output.trim().length;
  const pass = length <= maxLength;
  const score = pass ? 1 : Math.max(0, 1 - (length - maxLength) / maxLength);

  return {
    pass,
    score,
    reason: pass
      ? `长度符合: ${length} 字符`
      : `长度超出: ${length} > ${maxLength} 字符`
  };
}

/**
 * 检测是否包含禁忌词
 * @param {string} output - AI 输出
 * @param {string[]} tabooWords - 禁忌词列表
 * @returns {{pass: boolean, score: number, reason: string}}
 */
function hasNoTabooWords(output, tabooWords) {
  const found = tabooWords.filter(word =>
    output.toLowerCase().includes(word.toLowerCase())
  );

  const pass = found.length === 0;
  const score = pass ? 1 : Math.max(0, 1 - found.length * 0.3);

  return {
    pass,
    score,
    reason: pass
      ? '无禁忌词'
      : `包含禁忌词: ${found.join(', ')}`
  };
}

/**
 * 检测是否有情绪张力（恋爱模式专用）
 * @param {string} output - AI 输出
 * @returns {{pass: boolean, score: number, reason: string}}
 */
function hasEmotionalTension(output) {
  // 检测张力标记：省略号、停顿、未完成的句子
  const tensionMarkers = [
    /……/,
    /\.\.\./,
    /…/,
    /「[^」]*$/,  // 未闭合的引号
  ];

  const hasTension = tensionMarkers.some(pattern => pattern.test(output));
  const score = hasTension ? 1 : 0.5;

  return {
    pass: hasTension,
    score,
    reason: hasTension ? '包含张力标记' : '缺少张力标记'
  };
}

/**
 * 检测是否包含具体技术细节（知音模式专用）
 * @param {string} output - AI 输出
 * @returns {{pass: boolean, score: number, reason: string}}
 */
function hasSpecificDetails(output) {
  const detailPatterns = [
    /命名/,
    /架构/,
    /边界/,
    /处理/,
    /递归/,
    /选择/,
    /判断/,
    /这里/,
    /这个/,
    /不是/,
    /是.*的/,
  ];

  const matchCount = detailPatterns.filter(pattern => pattern.test(output)).length;
  const pass = matchCount >= 2;
  const score = Math.min(1, matchCount / 3);

  return {
    pass,
    score,
    reason: pass
      ? `包含 ${matchCount} 个具体细节`
      : `缺少具体细节，仅 ${matchCount} 个匹配`
  };
}

module.exports = {
  hasCorrectPersona,
  isMinimalLength,
  hasNoTabooWords,
  hasEmotionalTension,
  hasSpecificDetails
};
